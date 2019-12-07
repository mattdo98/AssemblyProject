;
; AssemblerApplication2.asm
;
; Created: 12/7/2019 2:18:54 PM
; Author : Matt Donald, Max Latura
;
;Ports used J1,Port E 

.dseg
.org 0x2000


.cseg
.org 0x0


jmp start

.org 0x1000
start:

;setup port J pin 
lds	r16,PORTC_DIR		;Store Port J to r16
ldi	r16,0b00000001		;turn bit 0 on
sts	PORTC_DIR,r16		;store r16 bacj to port J

ldi r16, 0b00000001		
sts PORTC_OUT, r16
ldi	r16, 0b00000000
sts PORTC_OUT,r16
	
end:	rjmp end

