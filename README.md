# nrf24le1_bootloader
Bootloader for nrf24le1 using sdcc. 
Based on the reference bootloader of Nordic.
The differences are: 
	device in ptx mode; 
	enable shockburst; 
	bootloader at 0x0000, firmware on top of bootloader; 
	firmware shares rf routines in bootloader(TODO).
