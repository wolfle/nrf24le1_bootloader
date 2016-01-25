;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.5.5 #9467 (Linux)
;--------------------------------------------------------
	.module main
	.optsdcc -mmcs51 --model-small
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _main
	.globl _delay_us
	.globl _flash_write_bytes
	.globl _flash_write_byte
	.globl _flash_erase_page
	.globl _flash_read_bytes
	.globl _rf_write_payload
	.globl _rf_read_rx_payload
	.globl _rf_enable_shockburst
	.globl _rf_set_rx_address
	.globl _rf_set_tx_address
	.globl _rf_power_down
	.globl _rf_write_register_one
	.globl _rf_spi_cmd_zero
	.globl _FSR_SB_ENDBG
	.globl _FSR_SB_STP
	.globl _FSR_SB_WEN
	.globl _FSR_SB_RDYN
	.globl _FSR_SB_INFEN
	.globl _FSR_SB_RDISMB
	.globl _RFCON_SB_RFCKEN
	.globl _RFCON_SB_RFCSN
	.globl _RFCON_SB_RFCE
	.globl _ADCON_SB_BD
	.globl _PSW_SB_P
	.globl _PSW_SB_F1
	.globl _PSW_SB_OV
	.globl _PSW_SB_RS0
	.globl _PSW_SB_RS1
	.globl _PSW_SB_F0
	.globl _PSW_SB_AC
	.globl _PSW_SB_CY
	.globl _T2CON_SB_T2PS
	.globl _T2CON_SB_I3FR
	.globl _T2CON_SB_I2FR
	.globl _T2CON_SB_T2R1
	.globl _T2CON_SB_T2R0
	.globl _T2CON_SB_T2CM
	.globl _T2CON_SB_T2I1
	.globl _T2CON_SB_T2I0
	.globl _IRCON_SB_EXF2
	.globl _IRCON_SB_TF2
	.globl _IRCON_SB_TICK
	.globl _IRCON_SB_MISCIRQ
	.globl _IRCON_SB_WUOPIRQ
	.globl _IRCON_SB_SPI_2WIRE
	.globl _IRCON_SB_RFIRQ
	.globl _IRCON_SB_RFRDY
	.globl _IEN1_SB_T2EXTRLD
	.globl _IEN1_SB_TICK
	.globl _IEN1_SB_MISCIRQ
	.globl _IEN1_SB_WUOPIRQ
	.globl _IEN1_SB_SPI_2WIRE
	.globl _IEN1_SB_RFIRQ
	.globl _IEN1_SB_RFRDY
	.globl _P3_SB_D7
	.globl _P3_SB_D6
	.globl _P3_SB_D5
	.globl _P3_SB_D4
	.globl _P3_SB_D3
	.globl _P3_SB_D2
	.globl _P3_SB_D1
	.globl _P3_SB_D0
	.globl _IEN0_SB_GLOBAL
	.globl _IEN0_SB_T2
	.globl _IEN0_SB_UART
	.globl _IEN0_SB_T1
	.globl _IEN0_SB_POFIRQ
	.globl _IEN0_SB_T0
	.globl _IEN0_SB_IFP
	.globl _P2_SB_D7
	.globl _P2_SB_D6
	.globl _P2_SB_D5
	.globl _P2_SB_D4
	.globl _P2_SB_D3
	.globl _P2_SB_D2
	.globl _P2_SB_D1
	.globl _P2_SB_D0
	.globl _S0CON_SB_SM0
	.globl _S0CON_SB_SM1
	.globl _S0CON_SB_SM20
	.globl _S0CON_SB_REN0
	.globl _S0CON_SB_TB80
	.globl _S0CON_SB_RB80
	.globl _S0CON_SB_TI0
	.globl _S0CON_SB_RI0
	.globl _P1_SB_D7
	.globl _P1_SB_D6
	.globl _P1_SB_D5
	.globl _P1_SB_D4
	.globl _P1_SB_D3
	.globl _P1_SB_D2
	.globl _P1_SB_D1
	.globl _P1_SB_D0
	.globl _TCON_SB_TF1
	.globl _TCON_SB_TR1
	.globl _TCON_SB_TF0
	.globl _TCON_SB_TR0
	.globl _TCON_SB_IE1
	.globl _TCON_SB_IT1
	.globl _TCON_SB_IE0
	.globl _TCON_SB_IT0
	.globl _P0_SB_D7
	.globl _P0_SB_D6
	.globl _P0_SB_D5
	.globl _P0_SB_D4
	.globl _P0_SB_D3
	.globl _P0_SB_D2
	.globl _P0_SB_D1
	.globl _P0_SB_D0
	.globl _ADCDAT
	.globl _S0REL
	.globl _T2
	.globl _T1
	.globl _T0
	.globl _CRC
	.globl _CC3
	.globl _CC2
	.globl _CC1
	.globl _SPIMDAT
	.globl _SPIMSTAT
	.globl _SPIMCON1
	.globl _SPIMCON0
	.globl _FCR
	.globl _FPCR
	.globl _FSR
	.globl _B
	.globl _ARCON
	.globl _MD5
	.globl _MD4
	.globl _MD3
	.globl _MD2
	.globl _MD1
	.globl _MD0
	.globl _RFCON
	.globl _SPIRDAT
	.globl _SPIRSTAT
	.globl _SPIRCON1
	.globl _SPIRCON0
	.globl _W2CON0
	.globl _W2CON1
	.globl _ACC
	.globl _CCPDATO
	.globl _CCPDATIB
	.globl _CCPDATIA
	.globl _POFCON
	.globl _COMPCON
	.globl _W2DAT
	.globl _W2SADR
	.globl _ADCON
	.globl _RNGDAT
	.globl _RNGCTL
	.globl _ADCDATL
	.globl _ADCDATH
	.globl _ADCCON1
	.globl _ADCCON2
	.globl _ADCCON3
	.globl _PSW
	.globl _WUOPC0
	.globl _WUOPC1
	.globl _TH2
	.globl _TL2
	.globl _CRCH
	.globl _CRCL
	.globl __XPAGE
	.globl _MPAGE
	.globl _T2CON
	.globl _CCH3
	.globl _CCL3
	.globl _CCH2
	.globl _CCL2
	.globl _CCH1
	.globl _CCL1
	.globl _CCEN
	.globl _IRCON
	.globl _SPISDAT
	.globl _SPISSTAT
	.globl _SPISCON1
	.globl _SPISCON0
	.globl _S0RELH
	.globl _IP1
	.globl _IEN1
	.globl _SPISRDSZ
	.globl _RTC2CPT00
	.globl _RTC2CMP1
	.globl _RTC2CMP0
	.globl _RTC2CON
	.globl _PWMCON
	.globl _RSTREAS
	.globl _P3
	.globl _WDSV
	.globl _OPMCON
	.globl _CLKLFCTRL
	.globl _RTC2CPT10
	.globl _RTC2CPT01
	.globl _S0RELL
	.globl _IP0
	.globl _IEN0
	.globl _MEMCON
	.globl _INTEXP
	.globl _WUCON
	.globl _PWRDWN
	.globl _CLKCTRL
	.globl _PWMDC1
	.globl _PWMDC0
	.globl _P2
	.globl _P1CON
	.globl _P0CON
	.globl _S0BUF
	.globl _S0CON
	.globl _P2CON
	.globl _P3DIR
	.globl _P2DIR
	.globl _P1DIR
	.globl _P0DIR
	.globl _DPS
	.globl _P1
	.globl _P3CON
	.globl _TH1
	.globl _TH0
	.globl _TL1
	.globl _TL0
	.globl _TMOD
	.globl _TCON
	.globl _PCON
	.globl _DPH1
	.globl _DPL1
	.globl _DPH
	.globl _DPL
	.globl _SP
	.globl _P0
	.globl _flash_can_be_written_without_erase_PARM_2
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
	.area RSEG    (ABS,DATA)
	.org 0x0000
_P0	=	0x0080
_SP	=	0x0081
_DPL	=	0x0082
_DPH	=	0x0083
_DPL1	=	0x0084
_DPH1	=	0x0085
_PCON	=	0x0087
_TCON	=	0x0088
_TMOD	=	0x0089
_TL0	=	0x008a
_TL1	=	0x008b
_TH0	=	0x008c
_TH1	=	0x008d
_P3CON	=	0x008f
_P1	=	0x0090
_DPS	=	0x0092
_P0DIR	=	0x0093
_P1DIR	=	0x0094
_P2DIR	=	0x0095
_P3DIR	=	0x0096
_P2CON	=	0x0097
_S0CON	=	0x0098
_S0BUF	=	0x0099
_P0CON	=	0x009e
_P1CON	=	0x009f
_P2	=	0x00a0
_PWMDC0	=	0x00a1
_PWMDC1	=	0x00a2
_CLKCTRL	=	0x00a3
_PWRDWN	=	0x00a4
_WUCON	=	0x00a5
_INTEXP	=	0x00a6
_MEMCON	=	0x00a7
_IEN0	=	0x00a8
_IP0	=	0x00a9
_S0RELL	=	0x00aa
_RTC2CPT01	=	0x00ab
_RTC2CPT10	=	0x00ac
_CLKLFCTRL	=	0x00ad
_OPMCON	=	0x00ae
_WDSV	=	0x00af
_P3	=	0x00b0
_RSTREAS	=	0x00b1
_PWMCON	=	0x00b2
_RTC2CON	=	0x00b3
_RTC2CMP0	=	0x00b4
_RTC2CMP1	=	0x00b5
_RTC2CPT00	=	0x00b6
_SPISRDSZ	=	0x00b7
_IEN1	=	0x00b8
_IP1	=	0x00b9
_S0RELH	=	0x00ba
_SPISCON0	=	0x00bc
_SPISCON1	=	0x00bd
_SPISSTAT	=	0x00be
_SPISDAT	=	0x00bf
_IRCON	=	0x00c0
_CCEN	=	0x00c1
_CCL1	=	0x00c2
_CCH1	=	0x00c3
_CCL2	=	0x00c4
_CCH2	=	0x00c5
_CCL3	=	0x00c6
_CCH3	=	0x00c7
_T2CON	=	0x00c8
_MPAGE	=	0x00c9
__XPAGE	=	0x00c9
_CRCL	=	0x00ca
_CRCH	=	0x00cb
_TL2	=	0x00cc
_TH2	=	0x00cd
_WUOPC1	=	0x00ce
_WUOPC0	=	0x00cf
_PSW	=	0x00d0
_ADCCON3	=	0x00d1
_ADCCON2	=	0x00d2
_ADCCON1	=	0x00d3
_ADCDATH	=	0x00d4
_ADCDATL	=	0x00d5
_RNGCTL	=	0x00d6
_RNGDAT	=	0x00d7
_ADCON	=	0x00d8
_W2SADR	=	0x00d9
_W2DAT	=	0x00da
_COMPCON	=	0x00db
_POFCON	=	0x00dc
_CCPDATIA	=	0x00dd
_CCPDATIB	=	0x00de
_CCPDATO	=	0x00df
_ACC	=	0x00e0
_W2CON1	=	0x00e1
_W2CON0	=	0x00e2
_SPIRCON0	=	0x00e4
_SPIRCON1	=	0x00e5
_SPIRSTAT	=	0x00e6
_SPIRDAT	=	0x00e7
_RFCON	=	0x00e8
_MD0	=	0x00e9
_MD1	=	0x00ea
_MD2	=	0x00eb
_MD3	=	0x00ec
_MD4	=	0x00ed
_MD5	=	0x00ee
_ARCON	=	0x00ef
_B	=	0x00f0
_FSR	=	0x00f8
_FPCR	=	0x00f9
_FCR	=	0x00fa
_SPIMCON0	=	0x00fc
_SPIMCON1	=	0x00fd
_SPIMSTAT	=	0x00fe
_SPIMDAT	=	0x00ff
_CC1	=	0xc3c2
_CC2	=	0xc5c4
_CC3	=	0xc7c6
_CRC	=	0xcbca
_T0	=	0x8c8a
_T1	=	0x8d8b
_T2	=	0xcdcc
_S0REL	=	0xbaaa
_ADCDAT	=	0xd4d5
;--------------------------------------------------------
; special function bits
;--------------------------------------------------------
	.area RSEG    (ABS,DATA)
	.org 0x0000
_P0_SB_D0	=	0x0080
_P0_SB_D1	=	0x0081
_P0_SB_D2	=	0x0082
_P0_SB_D3	=	0x0083
_P0_SB_D4	=	0x0084
_P0_SB_D5	=	0x0085
_P0_SB_D6	=	0x0086
_P0_SB_D7	=	0x0087
_TCON_SB_IT0	=	0x0088
_TCON_SB_IE0	=	0x0089
_TCON_SB_IT1	=	0x008a
_TCON_SB_IE1	=	0x008b
_TCON_SB_TR0	=	0x008c
_TCON_SB_TF0	=	0x008d
_TCON_SB_TR1	=	0x008e
_TCON_SB_TF1	=	0x008f
_P1_SB_D0	=	0x0090
_P1_SB_D1	=	0x0091
_P1_SB_D2	=	0x0092
_P1_SB_D3	=	0x0093
_P1_SB_D4	=	0x0094
_P1_SB_D5	=	0x0095
_P1_SB_D6	=	0x0096
_P1_SB_D7	=	0x0097
_S0CON_SB_RI0	=	0x0098
_S0CON_SB_TI0	=	0x0099
_S0CON_SB_RB80	=	0x009a
_S0CON_SB_TB80	=	0x009b
_S0CON_SB_REN0	=	0x009c
_S0CON_SB_SM20	=	0x009d
_S0CON_SB_SM1	=	0x009e
_S0CON_SB_SM0	=	0x009f
_P2_SB_D0	=	0x00a0
_P2_SB_D1	=	0x00a1
_P2_SB_D2	=	0x00a2
_P2_SB_D3	=	0x00a3
_P2_SB_D4	=	0x00a4
_P2_SB_D5	=	0x00a5
_P2_SB_D6	=	0x00a6
_P2_SB_D7	=	0x00a7
_IEN0_SB_IFP	=	0x00a8
_IEN0_SB_T0	=	0x00a9
_IEN0_SB_POFIRQ	=	0x00aa
_IEN0_SB_T1	=	0x00ab
_IEN0_SB_UART	=	0x00ac
_IEN0_SB_T2	=	0x00ad
_IEN0_SB_GLOBAL	=	0x00af
_P3_SB_D0	=	0x00b0
_P3_SB_D1	=	0x00b1
_P3_SB_D2	=	0x00b2
_P3_SB_D3	=	0x00b3
_P3_SB_D4	=	0x00b4
_P3_SB_D5	=	0x00b5
_P3_SB_D6	=	0x00b6
_P3_SB_D7	=	0x00b7
_IEN1_SB_RFRDY	=	0x00b8
_IEN1_SB_RFIRQ	=	0x00b9
_IEN1_SB_SPI_2WIRE	=	0x00ba
_IEN1_SB_WUOPIRQ	=	0x00bb
_IEN1_SB_MISCIRQ	=	0x00bc
_IEN1_SB_TICK	=	0x00bd
_IEN1_SB_T2EXTRLD	=	0x00bf
_IRCON_SB_RFRDY	=	0x00c0
_IRCON_SB_RFIRQ	=	0x00c1
_IRCON_SB_SPI_2WIRE	=	0x00c2
_IRCON_SB_WUOPIRQ	=	0x00c3
_IRCON_SB_MISCIRQ	=	0x00c4
_IRCON_SB_TICK	=	0x00c5
_IRCON_SB_TF2	=	0x00c6
_IRCON_SB_EXF2	=	0x00c7
_T2CON_SB_T2I0	=	0x00c8
_T2CON_SB_T2I1	=	0x00c9
_T2CON_SB_T2CM	=	0x00ca
_T2CON_SB_T2R0	=	0x00cb
_T2CON_SB_T2R1	=	0x00cc
_T2CON_SB_I2FR	=	0x00cd
_T2CON_SB_I3FR	=	0x00ce
_T2CON_SB_T2PS	=	0x00cf
_PSW_SB_CY	=	0x00d7
_PSW_SB_AC	=	0x00d6
_PSW_SB_F0	=	0x00d5
_PSW_SB_RS1	=	0x00d4
_PSW_SB_RS0	=	0x00d3
_PSW_SB_OV	=	0x00d2
_PSW_SB_F1	=	0x00d1
_PSW_SB_P	=	0x00d0
_ADCON_SB_BD	=	0x00df
_RFCON_SB_RFCE	=	0x00e8
_RFCON_SB_RFCSN	=	0x00e9
_RFCON_SB_RFCKEN	=	0x00ea
_FSR_SB_RDISMB	=	0x00fa
_FSR_SB_INFEN	=	0x00fb
_FSR_SB_RDYN	=	0x00fc
_FSR_SB_WEN	=	0x00fd
_FSR_SB_STP	=	0x00fe
_FSR_SB_ENDBG	=	0x00ff
;--------------------------------------------------------
; overlayable register banks
;--------------------------------------------------------
	.area REG_BANK_0	(REL,OVR,DATA)
	.ds 8
;--------------------------------------------------------
; internal ram data
;--------------------------------------------------------
	.area DSEG    (DATA)
_flash_can_be_written_without_erase_PARM_2:
	.ds 1
_send_PARM_2:
	.ds 1
_startFirmwareUpdate_reset_vector_1_53:
	.ds 3
_writeHexRecord_i_1_58:
	.ds 1
_writeHexRecord_checksum_1_58:
	.ds 1
_writeHexRecord_bytes_1_58:
	.ds 1
_writeHexRecord_addr_1_58:
	.ds 2
_main_channel_timer_1_69:
	.ds 2
_main_connection_timer_1_69:
	.ds 2
_main_ch_i_1_69:
	.ds 1
;--------------------------------------------------------
; overlayable items in internal ram 
;--------------------------------------------------------
;--------------------------------------------------------
; Stack segment in internal ram 
;--------------------------------------------------------
	.area	SSEG
__start__stack:
	.ds	1

;--------------------------------------------------------
; indirectly addressable internal ram data
;--------------------------------------------------------
	.area ISEG    (DATA)
_temp_data:
	.ds 16
_state:
	.ds 1
;--------------------------------------------------------
; absolute internal ram data
;--------------------------------------------------------
	.area IABS    (ABS,DATA)
	.area IABS    (ABS,DATA)
;--------------------------------------------------------
; bit data
;--------------------------------------------------------
	.area BSEG    (BIT)
_packet_received:
	.ds 1
_send_success:
	.ds 1
_main_sloc0_1_0:
	.ds 1
;--------------------------------------------------------
; paged external ram data
;--------------------------------------------------------
	.area PSEG    (PAG,XDATA)
;--------------------------------------------------------
; external ram data
;--------------------------------------------------------
	.area XSEG    (XDATA)
_rcvd_buf:
	.ds 32
_send_buf:
	.ds 32
;--------------------------------------------------------
; absolute external ram data
;--------------------------------------------------------
	.area XABS    (ABS,XDATA)
;--------------------------------------------------------
; external initialized ram data
;--------------------------------------------------------
	.area XISEG   (XDATA)
_default_channels:
	.ds 3
_default_pipe_address:
	.ds 5
_bytes_received:
	.ds 2
_bytes_total:
	.ds 2
_firmware_number:
	.ds 1
	.area HOME    (CODE)
	.area GSINIT0 (CODE)
	.area GSINIT1 (CODE)
	.area GSINIT2 (CODE)
	.area GSINIT3 (CODE)
	.area GSINIT4 (CODE)
	.area GSINIT5 (CODE)
	.area GSINIT  (CODE)
	.area GSFINAL (CODE)
	.area CSEG    (CODE)
;--------------------------------------------------------
; interrupt vector 
;--------------------------------------------------------
	.area HOME    (CODE)
__interrupt_vect:
	ljmp	__sdcc_gsinit_startup
;--------------------------------------------------------
; global & static initialisations
;--------------------------------------------------------
	.area HOME    (CODE)
	.area GSINIT  (CODE)
	.area GSFINAL (CODE)
	.area GSINIT  (CODE)
	.globl __sdcc_gsinit_startup
	.globl __sdcc_program_startup
	.globl __start__stack
	.globl __mcs51_genXINIT
	.globl __mcs51_genXRAMCLEAR
	.globl __mcs51_genRAMCLEAR
;	src/main.c:55: static state_t __idata state = PINGING;
	mov	r0,#_state
	mov	@r0,#0x00
	.area GSFINAL (CODE)
	ljmp	__sdcc_program_startup
;--------------------------------------------------------
; Home
;--------------------------------------------------------
	.area HOME    (CODE)
	.area HOME    (CODE)
__sdcc_program_startup:
	ljmp	_main
;	return from main will return to caller
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area CSEG    (CODE)
;------------------------------------------------------------
;Allocation info for local variables in function 'configureRF'
;------------------------------------------------------------
;__00020001                Allocated to registers 
;channel                   Allocated to registers 
;------------------------------------------------------------
;	src/main.c:60: static void configureRF()
;	-----------------------------------------
;	 function configureRF
;	-----------------------------------------
_configureRF:
	ar7 = 0x07
	ar6 = 0x06
	ar5 = 0x05
	ar4 = 0x04
	ar3 = 0x03
	ar2 = 0x02
	ar1 = 0x01
	ar0 = 0x00
;	src/main.c:62: packet_received = false;
	clr	_packet_received
;	src/main.c:63: send_success = false;
	clr	_send_success
;	src/main.c:65: rf_clock_enable();
	mov	_RFCON,#0x02
	setb _RFCON_SB_RFCKEN 
;	src/main.c:67: rf_set_tx_address(default_pipe_address,5);
	mov	_rf_set_tx_address_PARM_2,#0x05
	mov	dptr,#_default_pipe_address
	mov	b,#0x00
	lcall	_rf_set_tx_address
;	src/main.c:68: rf_set_rx_address(default_pipe_address,5,0);
	mov	_rf_set_rx_address_PARM_2,#0x05
	mov	_rf_set_rx_address_PARM_3,#0x00
	mov	dptr,#_default_pipe_address
	mov	b,#0x00
	lcall	_rf_set_rx_address
;	src/main.c:70: rf_set_channel(default_channels[1]);
	mov	dptr,#(_default_channels + 0x0001)
	movx	a,@dptr
	mov	_rf_write_register_one_PARM_2,a
;	../nRF24LE1_SDK/include/rf.h:389: rf_write_register_one(RF_RF_CH, channel);
	mov	dpl,#0x05
	lcall	_rf_write_register_one
;	src/main.c:72: rf_enable_shockburst(dr2m,n0dbm,5,false,true); //data rate 2m, retransmit 5 times, ptx mode, powerup
	mov	_rf_enable_shockburst_PARM_2,#0x03
	mov	_rf_enable_shockburst_PARM_3,#0x05
	clr	_rf_enable_shockburst_PARM_4
	setb	_rf_enable_shockburst_PARM_5
	mov	dpl,#0x01
	ljmp	_rf_enable_shockburst
;------------------------------------------------------------
;Allocation info for local variables in function 'resetRF'
;------------------------------------------------------------
;	src/main.c:79: static void resetRF()
;	-----------------------------------------
;	 function resetRF
;	-----------------------------------------
_resetRF:
;	src/main.c:82: rf_power_down();
	lcall	_rf_power_down
;	src/main.c:96: rf_clock_disable();
	clr _RFCON_SB_RFCKEN 
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'nrf_irq'
;------------------------------------------------------------
;status                    Allocated to registers r7 
;------------------------------------------------------------
;	src/main.c:101: static void nrf_irq()
;	-----------------------------------------
;	 function nrf_irq
;	-----------------------------------------
_nrf_irq:
;	src/main.c:103: uint8_t status=rf_get_status();
	mov	dpl,#0xFF
	lcall	_rf_spi_cmd_zero
;	src/main.c:106: if(rf_is_tx_ds_active(status))  send_success = true; // Data has been sent
	mov	a,dpl
	mov	r7,a
	jnb	acc.5,00102$
	setb	_send_success
00102$:
;	src/main.c:109: if(rf_is_max_rt_active(status)){
	mov	a,r7
	jnb	acc.4,00104$
;	src/main.c:110: rf_flush_tx();
	mov	dpl,#0xE1
	push	ar7
	lcall	_rf_spi_cmd_zero
	pop	ar7
;	src/main.c:111: send_success = false;
	clr	_send_success
00104$:
;	src/main.c:115: if(rf_is_rx_dr_active(status)){
	mov	a,r7
	jnb	acc.6,00107$
;	src/main.c:116: rf_read_rx_payload(rcvd_buf,PAYLOAD_SIZE,NULL); //can be only one payload from host ack
	mov	_rf_read_rx_payload_PARM_2,#0x20
	clr	a
	mov	_rf_read_rx_payload_PARM_3,a
	mov	(_rf_read_rx_payload_PARM_3 + 1),a
;	1-genFromRTrack replaced	mov	(_rf_read_rx_payload_PARM_3 + 2),#0x00
	mov	(_rf_read_rx_payload_PARM_3 + 2),a
	mov	dptr,#_rcvd_buf
	mov	b,#0x00
	lcall	_rf_read_rx_payload
;	src/main.c:117: packet_received = true;
	setb	_packet_received
00107$:
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'send'
;------------------------------------------------------------
;size                      Allocated with name '_send_PARM_2'
;command                   Allocated to registers r7 
;------------------------------------------------------------
;	src/main.c:124: static void send(command_t command, uint8_t size) //size includes cmd
;	-----------------------------------------
;	 function send
;	-----------------------------------------
_send:
	mov	r7,dpl
;	src/main.c:127: send_buf[0] = command;
	mov	dptr,#_send_buf
	mov	a,r7
	movx	@dptr,a
;	src/main.c:128: rf_write_payload(send_buf, size);
	mov	_rf_write_payload_PARM_2,_send_PARM_2
	mov	dptr,#_send_buf
	mov	b,#0x00
	lcall	_rf_write_payload
;	src/main.c:130: CE_H;
	setb _RFCON_SB_RFCE 
;	src/main.c:131: send_success = false;
	clr	_send_success
;	src/main.c:134: irq_wait_flag(rf_irq_flag) ;
00101$:
	jbc	_IRCON_SB_RFIRQ,00115$
	sjmp	00101$
00115$:
;	src/main.c:135: nrf_irq();
	lcall	_nrf_irq
;	src/main.c:137: CE_L;
	clr _RFCON_SB_RFCE 
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'sendInitAck'
;------------------------------------------------------------
;__00010003                Allocated to registers r7 
;__00020004                Allocated to registers 
;addr                      Allocated to registers 
;------------------------------------------------------------
;	src/main.c:141: static void sendInitAck()
;	-----------------------------------------
;	 function sendInitAck
;	-----------------------------------------
_sendInitAck:
;	src/main.c:144: send_buf[1] = model_number;
	mov	dptr,#_model_number
	clr	a
	movc	a,@a+dptr
	mov	dptr,#(_send_buf + 0x0001)
	movx	@dptr,a
;	src/main.c:145: send_buf[2] = flash_read_byte(FW_NUMBER); 
;	../nRF24LE1_SDK/include/memory.h:99: inline uint8_t flash_read_byte(uint16_t addr){return *((uint8_t __xdata *)addr);}
	mov	dptr,#0xFE00
	movx	a,@dptr
;	src/main.c:145: send_buf[2] = flash_read_byte(FW_NUMBER); 
	mov	dptr,#(_send_buf + 0x0002)
	movx	@dptr,a
;	src/main.c:146: send(CMD_ACK,3);
	mov	_send_PARM_2,#0x03
	mov	dpl,#0x07
	lcall	_send
;	src/main.c:148: if (send_success) state = CONNECTED;
	jnb	_send_success,00102$
	mov	r0,#_state
	mov	@r0,#0x01
	ret
00102$:
;	src/main.c:149: else state = PINGING;
	mov	r0,#_state
	mov	@r0,#0x00
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'startFirmwareUpdate'
;------------------------------------------------------------
;i                         Allocated to registers r6 
;checksum                  Allocated to registers r7 
;reset_vector              Allocated with name '_startFirmwareUpdate_reset_vector_1_53'
;------------------------------------------------------------
;	src/main.c:154: static void startFirmwareUpdate()
;	-----------------------------------------
;	 function startFirmwareUpdate
;	-----------------------------------------
_startFirmwareUpdate:
;	src/main.c:156: uint8_t i, checksum = 0, reset_vector[3];
	mov	r7,#0x00
;	src/main.c:159: for (i = 0; i < UPDATE_START_LENGTH; i++) {
	mov	r6,#0x00
00110$:
;	src/main.c:160: checksum += MSG_PAYLOAD(i);
	mov	a,r6
	inc	a
	mov	r5,a
	add	a,#_rcvd_buf
	mov	dpl,a
	clr	a
	addc	a,#(_rcvd_buf >> 8)
	mov	dph,a
	movx	a,@dptr
	mov	r4,a
	add	a,r7
	mov	r7,a
;	src/main.c:159: for (i = 0; i < UPDATE_START_LENGTH; i++) {
	mov	ar6,r5
	cjne	r6,#0x07,00139$
00139$:
	jc	00110$
;	src/main.c:163: if (checksum != 0) {
	mov	a,r7
	jz	00103$
;	src/main.c:164: send_buf[1] = ERROR_CHECKSUM_FAIL;
	mov	dptr,#(_send_buf + 0x0001)
	mov	a,#0x02
	movx	@dptr,a
;	src/main.c:165: send(CMD_NACK,2);
;	1-genFromRTrack replaced	mov	_send_PARM_2,#0x02
	mov	_send_PARM_2,a
	mov	dpl,#0x08
;	src/main.c:166: return;
	ljmp	_send
00103$:
;	src/main.c:170: bytes_total = MSG_ST_BYTES;
	mov	dptr,#(_rcvd_buf + 0x0001)
	movx	a,@dptr
	mov	r6,a
	mov	r7,#0x00
	mov	dptr,#(_rcvd_buf + 0x0002)
	movx	a,@dptr
	mov	r5,a
	mov	r4,#0x00
	orl	ar7,a
	mov	a,r4
	orl	ar6,a
	mov	dptr,#_bytes_total
	mov	a,r7
	movx	@dptr,a
	mov	a,r6
	inc	dptr
	movx	@dptr,a
;	src/main.c:172: if (bytes_total > FLASH_FW_MAX_SIZE) {
	clr	c
	mov	a,#0x20
	subb	a,r7
	mov	a,#0xF4
	subb	a,r6
	jnc	00105$
;	src/main.c:174: send_buf[1] = ERROR_ILLEGAL_SIZE;
	mov	dptr,#(_send_buf + 0x0001)
	mov	a,#0x04
	movx	@dptr,a
;	src/main.c:175: send(CMD_NACK,2);
	mov	_send_PARM_2,#0x02
	mov	dpl,#0x08
;	src/main.c:176: return;
	ljmp	_send
00105$:
;	src/main.c:180: temp_data[0] = MSG_ST_RESET_OPCODE;
	mov	dptr,#(_rcvd_buf + 0x0003)
	movx	a,@dptr
	mov	r7,a
	mov	r0,#_temp_data
	mov	@r0,ar7
;	src/main.c:181: temp_data[1] = MSG_ST_RESET_ADDR_H;
	mov	dptr,#(_rcvd_buf + 0x0004)
	movx	a,@dptr
	mov	r7,a
	mov	r0,#(_temp_data + 0x0001)
	mov	@r0,ar7
;	src/main.c:182: temp_data[2] = MSG_ST_RESET_ADDR_L;
	mov	dptr,#(_rcvd_buf + 0x0005)
	movx	a,@dptr
	mov	r7,a
	mov	r0,#(_temp_data + 0x0002)
	mov	@r0,ar7
;	src/main.c:184: flash_erase_page(FW_NV_DATA_PAGE);
	mov	dpl,#0x23
	lcall	_flash_erase_page
;	src/main.c:185: flash_write_bytes(FW_RESET_VECTOR, temp_data, 3);
	mov	_flash_write_bytes_PARM_2,#_temp_data
	mov	(_flash_write_bytes_PARM_2 + 1),#0x00
	mov	(_flash_write_bytes_PARM_2 + 2),#0x40
	mov	_flash_write_bytes_PARM_3,#0x03
	mov	(_flash_write_bytes_PARM_3 + 1),#0x00
	mov	dptr,#0xFE01
	lcall	_flash_write_bytes
;	src/main.c:187: firmware_number = MSG_ST_NUMBER;
	mov	dptr,#(_rcvd_buf + 0x0006)
	movx	a,@dptr
	mov	dptr,#_firmware_number
	movx	@dptr,a
;	src/main.c:188: bytes_received = 0;
	mov	dptr,#_bytes_received
	clr	a
	movx	@dptr,a
	inc	dptr
	movx	@dptr,a
;	src/main.c:191: movx_access_code();
	orl	_PCON,#0x10
;	src/main.c:192: flash_read_bytes(0x0000, reset_vector, 3);
	mov	_flash_read_bytes_PARM_2,#_startFirmwareUpdate_reset_vector_1_53
	mov	(_flash_read_bytes_PARM_2 + 1),#0x00
	mov	(_flash_read_bytes_PARM_2 + 2),#0x40
	mov	_flash_read_bytes_PARM_3,#0x03
	mov	(_flash_read_bytes_PARM_3 + 1),#0x00
	mov	dptr,#0x0000
	lcall	_flash_read_bytes
;	src/main.c:193: movx_access_data();
	mov	r7,_PCON
	mov	a,#0xEF
	anl	a,r7
	mov	_PCON,a
;	src/main.c:195: flash_erase_page(0);
	mov	dpl,#0x00
	lcall	_flash_erase_page
;	src/main.c:197: movx_access_code();
	orl	_PCON,#0x10
;	src/main.c:198: flash_write_bytes(0x0000, reset_vector, 3);
	mov	_flash_write_bytes_PARM_2,#_startFirmwareUpdate_reset_vector_1_53
	mov	(_flash_write_bytes_PARM_2 + 1),#0x00
	mov	(_flash_write_bytes_PARM_2 + 2),#0x40
	mov	_flash_write_bytes_PARM_3,#0x03
	mov	(_flash_write_bytes_PARM_3 + 1),#0x00
	mov	dptr,#0x0000
	lcall	_flash_write_bytes
;	src/main.c:199: movx_access_data();
	mov	r7,_PCON
	mov	a,#0xEF
	anl	a,r7
	mov	_PCON,a
;	src/main.c:201: for (i = 1; i < (bytes_total+FLASH_PAGE_SIZE-1)/FLASH_PAGE_SIZE ; ++i) {
	mov	r7,#0x01
00113$:
	mov	dptr,#_bytes_total
	movx	a,@dptr
	mov	r5,a
	inc	dptr
	movx	a,@dptr
	mov	r6,a
	mov	a,#0xFF
	add	a,r5
	mov	a,#0x01
	addc	a,r6
	clr	c
	rrc	a
	mov	r5,a
	mov	r6,#0x00
	mov	ar3,r7
	mov	r4,#0x00
	clr	c
	mov	a,r3
	subb	a,r5
	mov	a,r4
	subb	a,r6
	jnc	00106$
;	src/main.c:202: flash_erase_page(i);
	mov	dpl,r7
	push	ar7
	lcall	_flash_erase_page
	pop	ar7
;	src/main.c:201: for (i = 1; i < (bytes_total+FLASH_PAGE_SIZE-1)/FLASH_PAGE_SIZE ; ++i) {
	inc	r7
	sjmp	00113$
00106$:
;	src/main.c:205: send(CMD_ACK,1);
	mov	_send_PARM_2,#0x01
	mov	dpl,#0x07
	lcall	_send
;	src/main.c:206: if (send_success) state = RECEIVING_FIRMWARE;
	jnb	_send_success,00108$
	mov	r0,#_state
	mov	@r0,#0x02
	ret
00108$:
;	src/main.c:207: else state = PINGING;
	mov	r0,#_state
	mov	@r0,#0x00
;	src/main.c:209: return;
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'writeHexRecord'
;------------------------------------------------------------
;i                         Allocated with name '_writeHexRecord_i_1_58'
;checksum                  Allocated with name '_writeHexRecord_checksum_1_58'
;bytes                     Allocated with name '_writeHexRecord_bytes_1_58'
;addr                      Allocated with name '_writeHexRecord_addr_1_58'
;------------------------------------------------------------
;	src/main.c:214: static void writeHexRecord()
;	-----------------------------------------
;	 function writeHexRecord
;	-----------------------------------------
_writeHexRecord:
;	src/main.c:216: uint8_t i, checksum = 0, bytes = MSG_WR_BYTE_COUNT;
	mov	_writeHexRecord_checksum_1_58,#0x00
	mov	dptr,#(_rcvd_buf + 0x0001)
	movx	a,@dptr
	mov	_writeHexRecord_bytes_1_58,a
;	src/main.c:217: uint16_t addr = MSG_WR_ADDR;
	mov	dptr,#(_rcvd_buf + 0x0002)
	movx	a,@dptr
	mov	r4,a
	mov	r5,#0x00
	mov	dptr,#(_rcvd_buf + 0x0003)
	movx	a,@dptr
	mov	r3,a
	mov	r2,#0x00
	orl	a,r5
	mov	_writeHexRecord_addr_1_58,a
	mov	a,r2
	orl	a,r4
	mov	(_writeHexRecord_addr_1_58 + 1),a
;	src/main.c:220: for (i = 0; i < bytes+HEX_BYTES; i++) {
;	1-genFromRTrack replaced	mov	_writeHexRecord_i_1_58,#0x00
	mov	_writeHexRecord_i_1_58,r5
00114$:
	mov	r2,_writeHexRecord_bytes_1_58
	mov	r7,#0x00
	mov	a,#0x05
	add	a,r2
	mov	r4,a
	clr	a
	addc	a,r7
	mov	r5,a
	mov	r3,_writeHexRecord_i_1_58
	mov	r6,#0x00
	clr	c
	mov	a,r3
	subb	a,r4
	mov	a,r6
	xrl	a,#0x80
	mov	b,r5
	xrl	b,#0x80
	subb	a,b
	jnc	00101$
;	src/main.c:221: checksum += MSG_PAYLOAD(i);
	mov	a,_writeHexRecord_i_1_58
	inc	a
	mov	r6,a
	add	a,#_rcvd_buf
	mov	dpl,a
	clr	a
	addc	a,#(_rcvd_buf >> 8)
	mov	dph,a
	movx	a,@dptr
	mov	r5,a
	add	a,_writeHexRecord_checksum_1_58
	mov	_writeHexRecord_checksum_1_58,a
;	src/main.c:220: for (i = 0; i < bytes+HEX_BYTES; i++) {
	mov	_writeHexRecord_i_1_58,r6
	sjmp	00114$
00101$:
;	src/main.c:223: if (checksum != 0) {
	mov	a,_writeHexRecord_checksum_1_58
	jz	00125$
;	src/main.c:225: send_buf[1] = ERROR_CHECKSUM_FAIL;
	mov	dptr,#(_send_buf + 0x0001)
	mov	a,#0x02
	movx	@dptr,a
;	src/main.c:226: send(CMD_NACK,2);
;	1-genFromRTrack replaced	mov	_send_PARM_2,#0x02
	mov	_send_PARM_2,a
	mov	dpl,#0x08
;	src/main.c:227: return;
	ljmp	_send
;	src/main.c:231: for (i = 0; i < bytes; i++) {
00125$:
	mov	r6,#0x00
00117$:
	clr	c
	mov	a,r6
	subb	a,_writeHexRecord_bytes_1_58
	jnc	00104$
;	src/main.c:232: temp_data[i] = MSG_WR_DATA(i);
	mov	a,r6
	add	a,#_temp_data
	mov	r1,a
	mov	a,#0x05
	add	a,r6
	add	a,#_rcvd_buf
	mov	dpl,a
	clr	a
	addc	a,#(_rcvd_buf >> 8)
	mov	dph,a
	movx	a,@dptr
	mov	r5,a
	mov	@r1,a
;	src/main.c:231: for (i = 0; i < bytes; i++) {
	inc	r6
	sjmp	00117$
00104$:
;	src/main.c:236: if (addr == 0x0000) {
	mov	a,_writeHexRecord_addr_1_58
	orl	a,(_writeHexRecord_addr_1_58 + 1)
	jnz	00109$
;	src/main.c:237: movx_access_code();;
	orl	_PCON,#0x10
;	src/main.c:239: flash_write_bytes((addr+3), (temp_data+3), (bytes-3));
	mov	dpl,_writeHexRecord_addr_1_58
	mov	dph,(_writeHexRecord_addr_1_58 + 1)
	inc	dptr
	inc	dptr
	inc	dptr
	mov	_flash_write_bytes_PARM_2,#(_temp_data + 0x0003)
	mov	(_flash_write_bytes_PARM_2 + 1),#0x00
	mov	(_flash_write_bytes_PARM_2 + 2),#0x40
	mov	a,r2
	add	a,#0xFD
	mov	_flash_write_bytes_PARM_3,a
	mov	a,r7
	addc	a,#0xFF
	mov	(_flash_write_bytes_PARM_3 + 1),a
	push	ar7
	push	ar2
	lcall	_flash_write_bytes
	pop	ar2
	pop	ar7
;	src/main.c:240: movx_access_data();
	mov	r6,_PCON
	mov	a,#0xEF
	anl	a,r6
	mov	_PCON,a
	sjmp	00110$
00109$:
;	src/main.c:243: } else if (addr+bytes < FLASH_FW_MAX_SIZE) {
	mov	ar5,r2
	mov	ar6,r7
	mov	a,r5
	add	a,_writeHexRecord_addr_1_58
	mov	r5,a
	mov	a,r6
	addc	a,(_writeHexRecord_addr_1_58 + 1)
	mov	r6,a
	clr	c
	mov	a,r5
	subb	a,#0x20
	mov	a,r6
	subb	a,#0xF4
	jnc	00106$
;	src/main.c:245: movx_access_code();
	orl	_PCON,#0x10
;	src/main.c:246: flash_write_bytes(addr, temp_data, bytes);
	mov	_flash_write_bytes_PARM_2,#_temp_data
	mov	(_flash_write_bytes_PARM_2 + 1),#0x00
	mov	(_flash_write_bytes_PARM_2 + 2),#0x40
	mov	_flash_write_bytes_PARM_3,_writeHexRecord_bytes_1_58
	mov	(_flash_write_bytes_PARM_3 + 1),#0x00
	mov	dpl,_writeHexRecord_addr_1_58
	mov	dph,(_writeHexRecord_addr_1_58 + 1)
	push	ar7
	push	ar2
	lcall	_flash_write_bytes
	pop	ar2
	pop	ar7
;	src/main.c:247: movx_access_data();
	mov	r6,_PCON
	mov	a,#0xEF
	anl	a,r6
	mov	_PCON,a
	sjmp	00110$
00106$:
;	src/main.c:252: send_buf[1] = ERROR_ILLEGAL_ADDRESS;
	mov	dptr,#(_send_buf + 0x0001)
	mov	a,#0x03
	movx	@dptr,a
;	src/main.c:253: send(CMD_NACK,2);
	mov	_send_PARM_2,#0x02
	mov	dpl,#0x08
;	src/main.c:254: return;
	ljmp	_send
00110$:
;	src/main.c:258: bytes_received += bytes;
	mov	dptr,#_bytes_received
	movx	a,@dptr
	mov	r5,a
	inc	dptr
	movx	a,@dptr
	mov	r6,a
	mov	dptr,#_bytes_received
	mov	a,r2
	add	a,r5
	movx	@dptr,a
	mov	a,r7
	addc	a,r6
	inc	dptr
	movx	@dptr,a
;	src/main.c:260: send(CMD_ACK,1);
	mov	_send_PARM_2,#0x01
	mov	dpl,#0x07
	lcall	_send
;	src/main.c:261: if (!send_success) {
	jb	_send_success,00112$
;	src/main.c:262: state = ERROR;
	mov	r0,#_state
	mov	@r0,#0x03
00112$:
;	src/main.c:265: return;
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'readHexRecord'
;------------------------------------------------------------
;i                         Allocated to registers r6 
;bytes                     Allocated to registers r7 
;addr                      Allocated to registers r6 r5 
;------------------------------------------------------------
;	src/main.c:269: static void readHexRecord()
;	-----------------------------------------
;	 function readHexRecord
;	-----------------------------------------
_readHexRecord:
;	src/main.c:275: bytes = MSG_RE_BYTE_COUNT;
	mov	dptr,#(_rcvd_buf + 0x0001)
	movx	a,@dptr
	mov	r7,a
;	src/main.c:276: addr = MSG_RE_ADDR;
	mov	dptr,#(_rcvd_buf + 0x0002)
	movx	a,@dptr
	mov	r5,a
	mov	r6,#0x00
	mov	dptr,#(_rcvd_buf + 0x0003)
	movx	a,@dptr
	mov	r3,#0x00
	orl	ar6,a
	mov	a,r3
	orl	ar5,a
;	src/main.c:278: movx_access_code();
	orl	_PCON,#0x10
;	src/main.c:279: flash_read_bytes(addr, temp_data, bytes);
	mov	_flash_read_bytes_PARM_2,#_temp_data
	mov	(_flash_read_bytes_PARM_2 + 1),#0x00
	mov	(_flash_read_bytes_PARM_2 + 2),#0x40
	mov	_flash_read_bytes_PARM_3,r7
	mov	(_flash_read_bytes_PARM_3 + 1),#0x00
	mov	dpl,r6
	mov	dph,r5
	push	ar7
	push	ar6
	push	ar5
	lcall	_flash_read_bytes
	pop	ar5
	pop	ar6
	pop	ar7
;	src/main.c:280: movx_access_data();
	mov	r4,_PCON
	mov	a,#0xEF
	anl	a,r4
	mov	_PCON,a
;	src/main.c:282: if (addr == 0x0000) {
	mov	a,r6
	orl	a,r5
;	src/main.c:283: flash_read_bytes(FW_RESET_OPCODE, temp_data, 3);
	jnz	00102$
	mov	_flash_read_bytes_PARM_2,#_temp_data
	mov	(_flash_read_bytes_PARM_2 + 1),a
	mov	(_flash_read_bytes_PARM_2 + 2),#0x40
	mov	_flash_read_bytes_PARM_3,#0x03
	mov	(_flash_read_bytes_PARM_3 + 1),#0x00
	mov	dptr,#0xFE01
	push	ar7
	lcall	_flash_read_bytes
	pop	ar7
00102$:
;	src/main.c:286: for (i = 0; i < bytes; i++) {
	mov	r6,#0x00
00105$:
	clr	c
	mov	a,r6
	subb	a,r7
	jnc	00103$
;	src/main.c:287: send_buf[i+1] = temp_data[i];
	mov	a,r6
	inc	a
	mov	r5,a
	add	a,#_send_buf
	mov	dpl,a
	clr	a
	addc	a,#(_send_buf >> 8)
	mov	dph,a
	mov	a,r6
	add	a,#_temp_data
	mov	r1,a
	mov	a,@r1
	mov	r4,a
	movx	@dptr,a
;	src/main.c:286: for (i = 0; i < bytes; i++) {
	mov	ar6,r5
	sjmp	00105$
00103$:
;	src/main.c:289: send(CMD_ACK,bytes+1);
	mov	a,r7
	inc	a
	mov	_send_PARM_2,a
	mov	dpl,#0x07
;	src/main.c:291: return;
	ljmp	_send
;------------------------------------------------------------
;Allocation info for local variables in function 'main'
;------------------------------------------------------------
;__00010017                Allocated to registers r6 
;__00010014                Allocated to registers r7 
;cmd                       Allocated to registers r2 
;channel_timer             Allocated with name '_main_channel_timer_1_69'
;bootloader_timer          Allocated to registers r4 r5 
;connection_timer          Allocated with name '_main_connection_timer_1_69'
;ch_i                      Allocated with name '_main_ch_i_1_69'
;__00050006                Allocated to registers r7 
;__00060007                Allocated to registers 
;addr                      Allocated to registers 
;__00060009                Allocated to registers 
;channel                   Allocated to registers 
;__00060011                Allocated to registers r7 
;__00070012                Allocated to registers 
;addr                      Allocated to registers 
;__00020015                Allocated to registers 
;addr                      Allocated to registers 
;__00020018                Allocated to registers 
;addr                      Allocated to registers 
;------------------------------------------------------------
;	src/main.c:296: void main()
;	-----------------------------------------
;	 function main
;	-----------------------------------------
_main:
;	src/main.c:300: uint16_t channel_timer = 0, bootloader_timer = 0, connection_timer = 0;
	clr	a
	mov	_main_channel_timer_1_69,a
	mov	(_main_channel_timer_1_69 + 1),a
	mov	r4,a
	mov	r5,a
	mov	_main_connection_timer_1_69,a
	mov	(_main_connection_timer_1_69 + 1),a
;	src/main.c:301: uint8_t ch_i = 0;
;	1-genFromRTrack replaced	mov	_main_ch_i_1_69,#0x00
	mov	_main_ch_i_1_69,a
;	src/main.c:305: cli();
	clr _IEN0_SB_GLOBAL 
;	src/main.c:308: configureRF();
	push	ar5
	push	ar4
	lcall	_configureRF
;	src/main.c:315: running = true;
	setb	_main_sloc0_1_0
;	src/main.c:319: send(CMD_PING,1);
	mov	_send_PARM_2,#0x01
	mov	dpl,#0x09
	lcall	_send
	pop	ar4
	pop	ar5
;	src/main.c:320: while(running) {
00139$:
	jb	_main_sloc0_1_0,00194$
	ljmp	00141$
00194$:
;	src/main.c:322: if(send_success){
	jb	_send_success,00195$
	ljmp	00137$
00195$:
;	src/main.c:323: if (packet_received) {
;	src/main.c:324: packet_received = false;
	jbc	_packet_received,00196$
	ljmp	00125$
00196$:
;	src/main.c:325: connection_timer = 0;
	clr	a
	mov	_main_connection_timer_1_69,a
	mov	(_main_connection_timer_1_69 + 1),a
;	src/main.c:326: cmd = MSG_CMD;
	mov	dptr,#_rcvd_buf
	movx	a,@dptr
;	src/main.c:328: switch (cmd) {
	mov  r2,a
	add	a,#0xff - 0x0A
	jnc	00197$
	ljmp	00120$
00197$:
	mov	a,r2
	add	a,#(00198$-3-.)
	movc	a,@a+pc
	mov	dpl,a
	mov	a,r2
	add	a,#(00199$-3-.)
	movc	a,@a+pc
	mov	dph,a
	clr	a
	jmp	@a+dptr
00198$:
	.db	00119$
	.db	00116$
	.db	00101$
	.db	00102$
	.db	00114$
	.db	00105$
	.db	00108$
	.db	00120$
	.db	00120$
	.db	00120$
	.db	00115$
00199$:
	.db	00119$>>8
	.db	00116$>>8
	.db	00101$>>8
	.db	00102$>>8
	.db	00114$>>8
	.db	00105$>>8
	.db	00108$>>8
	.db	00120$>>8
	.db	00120$>>8
	.db	00120$>>8
	.db	00115$>>8
;	src/main.c:330: case CMD_INIT:
00101$:
;	src/main.c:332: sendInitAck();
	lcall	_sendInitAck
;	src/main.c:334: channel_timer = bootloader_timer = 0;
	clr	a
	mov	r4,a
	mov	r5,a
	mov	_main_channel_timer_1_69,a
	mov	(_main_channel_timer_1_69 + 1),a
;	src/main.c:335: break;
	ljmp	00139$
;	src/main.c:338: case CMD_UPDATE_START:
00102$:
;	src/main.c:339: if (state == CONNECTED) {
	mov	r0,#_state
	cjne	@r0,#0x01,00200$
	sjmp	00201$
00200$:
	ljmp	00139$
00201$:
;	src/main.c:342: startFirmwareUpdate();
	push	ar5
	push	ar4
	lcall	_startFirmwareUpdate
	pop	ar4
	pop	ar5
;	src/main.c:348: break;
	ljmp	00139$
;	src/main.c:351: case CMD_WRITE:
00105$:
;	src/main.c:352: if (state == RECEIVING_FIRMWARE) {
	mov	r0,#_state
	cjne	@r0,#0x02,00202$
	sjmp	00203$
00202$:
	ljmp	00139$
00203$:
;	src/main.c:353: writeHexRecord( ); 
	push	ar5
	push	ar4
	lcall	_writeHexRecord
	pop	ar4
	pop	ar5
;	src/main.c:359: break;
	ljmp	00139$
;	src/main.c:362: case CMD_UPDATE_COMPLETE:
00108$:
;	src/main.c:364: if (bytes_received == bytes_total) {
	mov	dptr,#_bytes_received
	movx	a,@dptr
	mov	r2,a
	inc	dptr
	movx	a,@dptr
	mov	r3,a
	mov	dptr,#_bytes_total
	movx	a,@dptr
	mov	r6,a
	inc	dptr
	movx	a,@dptr
	mov	r7,a
	mov	a,r2
	cjne	a,ar6,00110$
	mov	a,r3
	cjne	a,ar7,00110$
;	src/main.c:366: flash_write_byte(FW_NUMBER, firmware_number); 
	mov	dptr,#_firmware_number
	movx	a,@dptr
	mov	_flash_write_byte_PARM_2,a
	mov	dptr,#0xFE00
	push	ar5
	push	ar4
	lcall	_flash_write_byte
;	src/main.c:367: state = CONNECTED;
	mov	r0,#_state
	mov	@r0,#0x01
;	src/main.c:368: send(CMD_ACK,1);
	mov	_send_PARM_2,#0x01
	mov	dpl,#0x07
	lcall	_send
	pop	ar4
	pop	ar5
	sjmp	00111$
00110$:
;	src/main.c:370: send(CMD_NACK,1);
	mov	_send_PARM_2,#0x01
	mov	dpl,#0x08
	push	ar5
	push	ar4
	lcall	_send
	pop	ar4
	pop	ar5
00111$:
;	src/main.c:373: if (!send_success) {
	jnb	_send_success,00206$
	ljmp	00139$
00206$:
;	src/main.c:374: state = ERROR;
	mov	r0,#_state
	mov	@r0,#0x03
;	src/main.c:380: break;
	ljmp	00139$
;	src/main.c:383: case CMD_READ:
00114$:
;	src/main.c:384: readHexRecord();
	push	ar5
	push	ar4
	lcall	_readHexRecord
	pop	ar4
	pop	ar5
;	src/main.c:389: break;
	ljmp	00139$
;	src/main.c:392: case CMD_PONG:
00115$:
;	src/main.c:393: delay_us(10000); //Host have no transfer to do, delay 10 ms to reping
	mov	dptr,#0x2710
	push	ar5
	push	ar4
	lcall	_delay_us
;	src/main.c:394: send(CMD_PING,1);
	mov	_send_PARM_2,#0x01
	mov	dpl,#0x09
	lcall	_send
	pop	ar4
	pop	ar5
;	src/main.c:399: break;
	ljmp	00139$
;	src/main.c:402: case CMD_EXIT:
00116$:
;	src/main.c:403: send(CMD_ACK,1);
	mov	_send_PARM_2,#0x01
	mov	dpl,#0x07
	push	ar5
	push	ar4
	lcall	_send
	pop	ar4
	pop	ar5
;	src/main.c:404: if(send_success)running=false;
	jnb	_send_success,00118$
	clr	_main_sloc0_1_0
00118$:
;	src/main.c:405: state = PINGING;
	mov	r0,#_state
	mov	@r0,#0x00
;	src/main.c:406: break;
	ljmp	00139$
;	src/main.c:409: case CMD_NO_CMD:
00119$:
;	src/main.c:410: default:
00120$:
;	src/main.c:411: state = ERROR;
	mov	r0,#_state
	mov	@r0,#0x03
;	src/main.c:415: cmd = CMD_NO_CMD;
	ljmp	00139$
00125$:
;	src/main.c:417: state=PINGING;
	mov	r0,#_state
	mov	@r0,#0x00
;	src/main.c:418: if (++bootloader_timer > BOOTLOADER_TIMEOUT) {
	inc	r4
	cjne	r4,#0x00,00208$
	inc	r5
00208$:
	clr	c
	mov	a,#0x09
	subb	a,r4
	clr	a
	subb	a,r5
	jnc	00123$
;	src/main.c:419: bootloader_timer = 0;
	mov	r4,#0x00
	mov	r5,#0x00
;	../nRF24LE1_SDK/include/memory.h:99: inline uint8_t flash_read_byte(uint16_t addr){return *((uint8_t __xdata *)addr);}
	mov	dptr,#0xFE00
	movx	a,@dptr
	mov	r7,a
;	src/main.c:420: running = (flash_read_byte(FW_NUMBER) != 0xFF) ? false : true;
	cjne	r7,#0xFF,00210$
	setb	c
	sjmp	00211$
00210$:
	clr	c
00211$:
	mov	_main_sloc0_1_0,c
00123$:
;	src/main.c:422: send(CMD_PING,1);
	mov	_send_PARM_2,#0x01
	mov	dpl,#0x09
	push	ar5
	push	ar4
	lcall	_send
	pop	ar4
	pop	ar5
	ljmp	00139$
00137$:
;	src/main.c:425: if (state == PINGING) {
	mov	r0,#_state
	mov	a,@r0
	jnz	00134$
;	src/main.c:427: if (++channel_timer > CHANNEL_TIMEOUT) {
	inc	_main_channel_timer_1_69
	clr	a
	cjne	a,_main_channel_timer_1_69,00213$
	inc	(_main_channel_timer_1_69 + 1)
00213$:
	clr	c
	mov	a,#0x20
	subb	a,_main_channel_timer_1_69
	mov	a,#0x03
	subb	a,(_main_channel_timer_1_69 + 1)
	jc	00214$
	ljmp	00139$
00214$:
;	src/main.c:428: channel_timer = 0;
	clr	a
	mov	_main_channel_timer_1_69,a
	mov	(_main_channel_timer_1_69 + 1),a
;	src/main.c:430: ch_i = (ch_i+1)%3;
	mov	r3,_main_ch_i_1_69
	mov	r7,#0x00
	mov	dpl,r3
	mov	dph,r7
	inc	dptr
	mov	__modsint_PARM_2,#0x03
;	1-genFromRTrack replaced	mov	(__modsint_PARM_2 + 1),#0x00
	mov	(__modsint_PARM_2 + 1),a
	push	ar5
	push	ar4
	lcall	__modsint
;	src/main.c:431: rf_set_channel(default_channels[ch_i]);
	mov	a,dpl
	mov	_main_ch_i_1_69,a
	add	a,#_default_channels
	mov	dpl,a
	clr	a
	addc	a,#(_default_channels >> 8)
	mov	dph,a
	movx	a,@dptr
	mov	_rf_write_register_one_PARM_2,a
;	../nRF24LE1_SDK/include/rf.h:389: rf_write_register_one(RF_RF_CH, channel);
	mov	dpl,#0x05
	lcall	_rf_write_register_one
	pop	ar4
	pop	ar5
;	src/main.c:440: if (++bootloader_timer > BOOTLOADER_TIMEOUT) {
	inc	r4
	cjne	r4,#0x00,00215$
	inc	r5
00215$:
	clr	c
	mov	a,#0x09
	subb	a,r4
	clr	a
	subb	a,r5
	jc	00216$
	ljmp	00139$
00216$:
;	src/main.c:441: bootloader_timer = 0;
	mov	r4,#0x00
	mov	r5,#0x00
;	../nRF24LE1_SDK/include/memory.h:99: inline uint8_t flash_read_byte(uint16_t addr){return *((uint8_t __xdata *)addr);}
	mov	dptr,#0xFE00
	movx	a,@dptr
	mov	r7,a
;	src/main.c:442: running = (flash_read_byte(FW_NUMBER) != 0xFF) ? false : true;
	cjne	r7,#0xFF,00217$
	setb	c
	sjmp	00218$
00217$:
	clr	c
00218$:
	mov	_main_sloc0_1_0,c
	ljmp	00139$
00134$:
;	src/main.c:447: if (++connection_timer > CONNECTION_TIMEOUT) state = PINGING;
	inc	_main_connection_timer_1_69
	clr	a
	cjne	a,_main_connection_timer_1_69,00219$
	inc	(_main_connection_timer_1_69 + 1)
00219$:
	clr	c
	mov	a,#0x60
	subb	a,_main_connection_timer_1_69
	mov	a,#0xEA
	subb	a,(_main_connection_timer_1_69 + 1)
	jc	00220$
	ljmp	00139$
00220$:
	mov	r0,#_state
	mov	@r0,#0x00
	ljmp	00139$
00141$:
;	src/main.c:452: resetRF();
	lcall	_resetRF
;	src/main.c:462: temp_data[0] = flash_read_byte(FW_RESET_ADDR_H);
;	../nRF24LE1_SDK/include/memory.h:99: inline uint8_t flash_read_byte(uint16_t addr){return *((uint8_t __xdata *)addr);}
	mov	dptr,#0xFE02
	movx	a,@dptr
	mov	r7,a
;	src/main.c:462: temp_data[0] = flash_read_byte(FW_RESET_ADDR_H);
	mov	r0,#_temp_data
	mov	@r0,ar7
;	src/main.c:463: temp_data[1] = flash_read_byte(FW_RESET_ADDR_L);
;	../nRF24LE1_SDK/include/memory.h:99: inline uint8_t flash_read_byte(uint16_t addr){return *((uint8_t __xdata *)addr);}
	mov	dptr,#0xFE03
	movx	a,@dptr
	mov	r6,a
;	src/main.c:463: temp_data[1] = flash_read_byte(FW_RESET_ADDR_L);
	mov	r0,#(_temp_data + 0x0001)
	mov	@r0,ar6
;	src/main.c:465: sti(); //Should we enable irqs? or should the firmware enable it later?
	setb _IEN0_SB_GLOBAL 
;	src/main.c:467: ((firmware_start)(((uint16_t)temp_data[0]<<8) | (temp_data[1])))();
	mov	ar5,r7
	clr	a
	mov	r7,a
	mov	r4,a
	mov	a,r6
	orl	ar7,a
	mov	a,r4
	orl	ar5,a
	push	ar7
	push	ar5
	mov	dpl,r7
	mov	dph,r5
	lcall	__sdcc_call_dptr
	pop	ar5
	pop	ar7
	ret
	.area CSEG    (CODE)
	.area CONST   (CODE)
_model_number:
	.db #0x10	; 16
	.area XINIT   (CODE)
__xinit__default_channels:
	.db #0x02	; 2
	.db #0x06	; 6
	.db #0x51	; 81	'Q'
__xinit__default_pipe_address:
	.db #0xBA	; 186
	.db #0xDA	; 218
	.db #0x55	; 85	'U'
	.db #0x13	; 19
	.db #0x37	; 55	'7'
__xinit__bytes_received:
	.byte #0x00,#0x00	; 0
__xinit__bytes_total:
	.byte #0x00,#0x00	; 0
__xinit__firmware_number:
	.db #0x00	; 0
	.area CABS    (ABS,CODE)
