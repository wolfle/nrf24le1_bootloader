/******************************************************************************
 * Boot loader for the Firmware Update over-the-air Application Note.
 *
 * Authors: Vegar Kåsli and Ole Magnus Ruud
 *
 * abbreviations/acronyms used in this document:
 * BL = Boot Loader
 * FW = Firmware
 * MSG = Message
 * CMD = Command
 * NV = Non-volatile
 * 
 ******************************************************************************/

//lint -e717
//lint -e534
//lint -e714
//lint -e783

#include "main.h"

/******************************************************************************/

// Typedefs:

// Device states
typedef enum {
  PINGING  = 0x00,
  CONNECTED,
  RECEIVING_FIRMWARE,
  ERROR
} state_t;

// Function pointer to firmware
typedef void (*firmware_start)(void);

/******************************************************************************/

// RF Communication 
static const uint8_t __xdata default_channels[CHANNELS_SIZE] = CHANNELS;
static const uint8_t __xdata default_pipe_address[5] = PIPE_ADDRESS;
static uint8_t __xdata rcvd_buf[PAYLOAD_SIZE];
static uint8_t __xdata send_buf[PAYLOAD_SIZE];
static uint16_t __xdata bytes_received = 0;
static uint16_t __xdata bytes_total = 0;
static uint8_t __xdata firmware_number = 0;
static bool packet_received;
static bool send_success;

// Temporary buffer in idata memory.
static uint8_t __idata temp_data[16];
static state_t __idata state = PINGING;

/******************************************************************************/

// Configures RF parameters before Enhanced Shockburst can be used.
static void configureRF()
{
  packet_received = false;
  // Enable the radio clock
  rf_clock_enable();
  // Set pipe address
  rf_set_tx_address(default_pipe_address,5);
  rf_set_rx_address(default_pipe_address,5,0);
  // Set initial channelC
  rf_set_channel(default_channels[1]);
  // Enable shockburst
  rf_enable_shockburst(dr2m,n0dbm,5,false,true); //data rate 2m, retransmit 5 times, ptx mode, powerup
  
  //rf_power_up();
}

// Resets RF parameters to default values.
// Must be called before jumping to new firmware.
static void resetRF()
{
  // PWR_UP = 0
  rf_power_down();
  // PRIM_RX = 0
  //rf_set_as_tx();
  // RF_CH = 0x02;
  //rf_set_channel(reset_channel);
  // AW = 11 (Default = 5 bytes)
  // RX_ADDR_P0 = TX_ADDR = 0xE7E7E7E7E7
  //rf_set_tx_address(reset_pipe_address,5);
  //rf_set_rx_address(reset_pipe_address, 5, 0);
  // ARD = 0000, ARC = 0011
  //rf_set_auto_rtr(3, 250);
  // RX_PW_P0 = 0x00
  //rf_set_rx_payload_width(0, 0);
  // Disable radio clock
  rf_clock_disable();
}

/* Radio "interrupt" routine.
 * (but it is only manually called) */
static void nrf_irq()
{
  uint8_t status=rf_get_status();

  // Transmission success
  if(rf_is_tx_ds_active(status))  send_success = true; // Data has been sent
  
  // Transmission failed (maximum re-transmits)
  if(rf_is_max_rt_active(status)){
      rf_flush_tx();
      send_success = false;
  }

  // Data received 
  if(rf_is_rx_dr_active(status)){
      rf_read_rx_payload(rcvd_buf,PAYLOAD_SIZE,NULL); //can be only one payload from host ack
      packet_received = true;
  }
}

/* Send function.
 * Write to send_buf[1] - send_buf[31] before calling this function.
 * command will be placed in send_buf[0].*/
static void send(command_t command, uint8_t size) //size includes cmd
{
  send_success = false;
  packet_received = false;
 // Copy command to send buffer.
  send_buf[0] = command;
  rf_write_payload(send_buf, size);

  // Activate sender
  CE_H;
  // Wait for radio to transmit
  irq_wait_flag(rf_irq_flag) ;
  nrf_irq();

  CE_L;
}

// Sends model number and firmware version number to host.
static void sendInitAck()
{
  // Send model number and firmware number
  send_buf[1] = MODEL_NUM;
  send_buf[2] = flash_read_byte(FW_NUMBER); 
  send(CMD_ACK,3);

  if (send_success) state = CONNECTED;
  else state = PINGING;
}

// Verifies that update-start command is valid.
// Will enter RECEIVING_FIRMWARE state if everything checks out.
static void startFirmwareUpdate()
{
  uint8_t i, checksum = 0;//, reset_vector[3];
              
  // Calculate checksum
  for (i = 0; i < UPDATE_START_LENGTH; i++) {
    checksum += MSG_PAYLOAD(i);
  }
  // Checksum fail
  if (checksum != 0) {
    send_buf[1] = ERROR_CHECKSUM_FAIL;
    send(CMD_NACK,2);
    return;
  }

  // Get firmware size, NOT including reset vector
  bytes_total = MSG_ST_BYTES;
  // Check that firmware is within legal size range.
  if (bytes_total > FLASH_FW_MAX_SIZE) {
    // Send error report to host.
    send_buf[1] = ERROR_ILLEGAL_SIZE;
    send(CMD_NACK,2);
    return;
  }

  // Get firmware's reset vector. 
  temp_data[0] = MSG_ST_RESET_OPCODE;
  temp_data[1] = MSG_ST_RESET_ADDR_H;
  temp_data[2] = MSG_ST_RESET_ADDR_L;
  // Write reset vector to non-volatile flash
  flash_erase_page(FW_NV_DATA_PAGE);
  flash_write_bytes(FW_RESET_VECTOR, temp_data, 3);
  // Get firmware serial number. Will be written to NV when update complete.
  firmware_number = MSG_ST_NUMBER;
  bytes_received = 0;
/*
  // Read out old reset vector.
  movx_access_code();
  flash_read_bytes(0x0000, reset_vector, 3);
  movx_access_data();
  // Erase first page, containing reset vector.
  flash_erase_page(0);
  // Write back the old reset vector.
  movx_access_code();
  flash_write_bytes(0x0000, reset_vector, 3);
  movx_access_data();
  // Erase the reset of pages available to firmware.
*/
  for (i = BOOTLOADER_PAGES; i < BOOTLOADER_PAGES+(bytes_total+FLASH_PAGE_SIZE-1)/FLASH_PAGE_SIZE ; ++i) {
    flash_erase_page(i);
  }

  send(CMD_ACK,1);
  if (send_success) state = RECEIVING_FIRMWARE;
  else state = PINGING;

  return;
}

// Writes hex-record's data field to flash memory.
// Will update bytes_received and send reply to host.
static void writeHexRecord()
{
  uint8_t i, checksum = 0, bytes = MSG_WR_BYTE_COUNT;
  uint16_t addr = MSG_WR_ADDR;

  // Calculate checksum for message. 
  for (i = 0; i < bytes+HEX_BYTES; i++) {
    checksum += MSG_PAYLOAD(i);
  }
  if (checksum != 0) {
    // Checksum fail
    send_buf[1] = ERROR_CHECKSUM_FAIL;
    send(CMD_NACK,2);
    return;
  }

  // Copy data portion of payload to idata temp memory.
  for (i = 0; i < bytes; i++) {
    temp_data[i] = MSG_WR_DATA(i);
  }
/*
  // This will prevent the reset vector from being overwritten. 
  if (addr == 0x0000) {
     movx_access_code();;
    // Offset write with the 3 bytes of the reset vector
    flash_write_bytes((addr+3), (temp_data+3), (bytes-3));
    movx_access_data();
    
  // Make sure that bytes to be written is within legal pages.
  } else */
  if (addr+bytes < FLASH_FW_MAX_SIZE && addr >= FLASH_FW_BEGIN) {
    // Write line to flash. 
     movx_access_code();
    flash_write_bytes(addr, temp_data, bytes);
    movx_access_data();

  // Address is outside pages available to new firmware.
  } else {
    send_buf[1] = ERROR_ILLEGAL_ADDRESS;
    send(CMD_NACK,2);
    return;
  }

  // Add bytes to total received.
  bytes_received += bytes;
  // Acknowledge message
  send(CMD_ACK,1);
  if (!send_success) {
    state = ERROR;
  }

  return;
}

// Sends requested bytes of data to host.
static void readHexRecord()
{
  uint8_t i, bytes;
  uint16_t addr;

  // Get memory address and number of bytes to read.
  bytes = MSG_RE_BYTE_COUNT;
  addr = MSG_RE_ADDR;
  // Copy flash memory bytes to temporary idata buffer.
  movx_access_code();
  flash_read_bytes(addr, temp_data, bytes);
  movx_access_data();
  // If request is for reset vector, read from non-volatile mem.
  if (addr == 0x0000) {
    flash_read_bytes(FW_RESET_VECTOR, temp_data, 3);
  }
  // Copy to send buffer
  for (i = 0; i < bytes; i++) {
    send_buf[i+1] = temp_data[i];
  }
  send(CMD_ACK,bytes+1);

  return;
}


/* Ma-ma-ma-main function! */
void main()
{
  command_t cmd = CMD_NO_CMD;

  uint16_t channel_timer = 0, bootloader_timer = 0, connection_timer = 0;
  uint8_t ch_i = 0;
  bool running;
	
  // Disable global interrupt
  cli();
  
  // Set up parameters for RF communication.
  configureRF();

  #ifdef DEBUG_LED_
  P0DIR = 0;
  P0 = 0x55;
  #endif 

  running = true;
  // Boot loader loop.
  // Will terminate after a couple of seconds if firmware has been successfully
  // installed.
  send(CMD_PING,1);
  while(running) {
	  	
	  if(send_success){
	      if (packet_received) {
	        connection_timer = 0;
	        cmd = MSG_CMD;
	     
	        switch (cmd) {
	          // Host initiates contact with the device.
	          case CMD_INIT:
	            // Send ACK to host, go to CONNECTED state if successful.
	            sendInitAck();
	            // Reset timers 
	            channel_timer = bootloader_timer = 0;
	            break;
	
	          // Host starts a firmware update.
	          case CMD_UPDATE_START:
	            if (state == CONNECTED) {
	              // Initiate firmware updates, go to RECEIVING_FIRMWARE state
	              // if successful.
	              startFirmwareUpdate();
	            }
	
	            #ifdef DEBUG_LED_
	            P0 = state;
	            #endif 
	            break;
	
	          // Write message containing one hex record.
	          case CMD_WRITE:
	            if (state == RECEIVING_FIRMWARE) {
	              writeHexRecord( ); 
	            }
	
	            #ifdef DEBUG_LED_
	            P0 = 0x40;
	            #endif
	            break;
	
	          // Firmware update has been completed.
	          case CMD_UPDATE_COMPLETE:
	            // Check that every byte is received.
	            if (bytes_received == bytes_total) {
	              // Mark firmware as successfully installed. 
	              flash_write_byte(FW_NUMBER, firmware_number); 
	              state = CONNECTED;
	              send(CMD_ACK,1);
	            } else {
	              send(CMD_NACK,1);
	            }
	
	            if (!send_success) {
	              state = ERROR;
	            }
	
	            #ifdef DEBUG_LED_
	            P0 = 0x10;
	            #endif
	            break;
	
	          // Host request data from flash at specified address.
	          case CMD_READ:
	            readHexRecord();
	
	            #ifdef DEBUG_LED_
	            P0 = 0x20;
	            #endif
	            break;
	
	          // Host sends pong to keep connections with device.
	          case CMD_PONG:
	              delay_us(10000); //Host have no transfer to do, delay 10 ms to reping
	              send(CMD_PING,1);
	
	            #ifdef DEBUG_LED_
	            P0 = 0x80;
	            #endif
	            break;
	
	          // Host sends disconnect
	          case CMD_EXIT:
				send(CMD_ACK,1);
				if(send_success)running=false;
	            state = PINGING;
	            break;
	
	          // These commands should no be received.
	          case CMD_NO_CMD:
	          default:
	            state = ERROR;
	            break;
	        }
	        // Clear command
	        cmd = CMD_NO_CMD;
	      }else{ //Host app do not reply
			  state=PINGING;
		        if (++bootloader_timer > BOOTLOADER_TIMEOUT) {
		          bootloader_timer = 0;
		          running = (flash_read_byte(FW_NUMBER) != 0xFF) ? false : true;
		        }else  send(CMD_PING,1);
		  }
	  }else{ //host unreached
		  if (state == PINGING) {
		     // Will ping to one channel for 'a while' before changing.
		      if (++channel_timer > CHANNEL_TIMEOUT) {
		        channel_timer = 0;
		        // Go to next channel
		        ch_i = (ch_i+1)%3;
		        rf_set_channel(default_channels[ch_i]);
		
		        #ifdef DEBUG_LED_
		        P0 = ch_i;
		        #endif
		
		        // After changing channels and being in the PINGING state
		        // for 'a while', boot loader loop will check if there is firmware
		        // installed, and if so end the while(running) loop.
		        if (++bootloader_timer > BOOTLOADER_TIMEOUT) {
		          bootloader_timer = 0;
		          running = (flash_read_byte(FW_NUMBER) != 0xFF) ? false : true;
		        }else send(CMD_PING,1);
		      }
			  
		  }else {
		      if (++connection_timer > CONNECTION_TIMEOUT) state = PINGING;
		      send(CMD_PING,1);
		  }
	  }
  }
	
	resetRF();

  #ifdef DEBUG_LED_
  // Default value for P0DIR
  P0 = 0x00;
  P0DIR = 0xFF;
  #endif


  // Reads address of firmware's reset vector.
  temp_data[0] = flash_read_byte(FW_RESET_ADDR_H);
  temp_data[1] = flash_read_byte(FW_RESET_ADDR_L);
	
  // sti(); //Should we enable irqs? or should the firmware enable it later?
 // Jump to firmware. Goodbye!
	((firmware_start)(((uint16_t)temp_data[0]<<8) | (temp_data[1])))();
}

