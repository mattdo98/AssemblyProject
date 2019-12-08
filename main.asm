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

;setup port J (named port C in manual) pin 
lds	r16,PORTC_DIR		;Store Port J to r16
ldi	r16,0b00000001		;turn bit 0 on
sts	PORTC_DIR,r16		;store r16 back to port J

;First light turning on
ldi r16, 0b00000001
sts PORTC_OUT, r16
;First light turning off
ldi	r16, 0b00000000
sts PORTC_OUT,r16

;Second light turning on
ldi r16, 0b00000010
sts PORTC_OUT, r16
;Second light turning off
ldi	r16, 0b00000000
sts PORTC_OUT,r16

;Third light turning on
ldi r16, 0b00000100
sts PORTC_OUT, r16

;Third light turning off
ldi	r16, 0b00000000
sts PORTC_OUT,r16

;Fourth light turning on
ldi r16, 0b00001000
sts PORTC_OUT, r16
;Fourth light turning off
ldi	r16, 0b00000000
sts PORTC_OUT,r16

;Fifth light turning on
ldi r16, 0b00010000
sts PORTC_OUT, r16
;Fifth light turning off
ldi	r16, 0b00000000
sts PORTC_OUT,r16

;Sixth light turning on
ldi r16, 0b00100000
sts PORTC_OUT, r16
;Sixth light turning off
ldi	r16, 0b00000000
sts PORTC_OUT,r16

	
end:	rjmp end

