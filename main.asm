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
	ldi	r16,0b00111111		;turn bit 0 on
	sts	PORTC_DIR,r16		;store r16 back to port J

;First light turning on
	ldi	r16, 0b00000001
	sts	PORTC_OUT, r16
	ldi	r16, 42
	call	delay
;First light turning off
	ldi	r16, 0b00000000
	sts	PORTC_OUT,r16
	ldi	r16, 77
	call	delay
;Second light turning on
	ldi	r16, 0b00000010
	sts	PORTC_OUT, r16
	ldi	r16, 92
	call	delay
;Second light turning off
	ldi	r16, 0b00000000
	sts	PORTC_OUT,r16
	ldi	r16, 72
	call	delay
;Third light turning on
	ldi	r16, 0b00000100
	sts	PORTC_OUT, r16
	ldi	r16, 43
	call	delay
;Third light turning off
	ldi	r16, 0b00000000
	sts	PORTC_OUT,r16
	ldi	r16, 89
	call	delay
;Fourth light turning on
	ldi	r16, 0b00001000
	sts	PORTC_OUT, r16
	ldi	r16, 97
	call	delay
;Fourth light turning off
	ldi	r16, 0b00000000
	sts	PORTC_OUT,r16
	ldi	r16, 64
	call	delay
;Fifth light turning on
	ldi	r16, 0b00010000
	sts	PORTC_OUT, r16
	ldi	r16, 46
	call	delay
;Fifth light turning off
	ldi	r16, 0b00000000
	sts	PORTC_OUT,r16
	ldi	r16, 93
	call	delay
;Sixth light turning on
	ldi	r16, 0b00100000
	sts	PORTC_OUT, r16
	ldi	r16, 51
	call	delay
;Sixth light turning off
	ldi	r16, 0b00000000
	sts	PORTC_OUT,r16

	
end:	rjmp end



delay:
	ldi	r21,0x01
	ldi	r20,0		; configure TCE1 to operate in normal mode
	sts	TCC0_CTRLB,r20     
	ldi	r20,low(10000)	; set PER to 10,000
	sts	TCE1_PER,r20      
	ldi	r20,high(10000)   
	sts	TCC0_PER+1,r20    
	clr	r20		; let CNT to count up from 0
	sts	TCE1_CNT,r20      
	sts	TCE1_CNT+1,r20    
	sts	TCE1_INTFLAGS,r21	; clear overflow interupt overflow flag
	ldi	r20,0b00000001	; enable TCE1 CLK, set prescaler to CLK.
	sts	TCE1_CTRLA,r20    
dcycle:   lds   r20,TCE1_INTFLAGS	; wait label
	sbrs	r20,0		; skip next instruction if interupt flag has been triggered.
	rjmp	dcycle		; jmp back up if not skipped
	sts	TCE1_INTFLAGS,r21	; clear the interupt flag.
	dec	r16
	brne	dcycle		; Branch if r16 isn't 0 yet.
	ret
