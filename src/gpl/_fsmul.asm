;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.4.1 #9072 (Jan 24 2019) (Linux)
; This file was generated Thu Jan 24 08:46:17 2019
;--------------------------------------------------------
	.module _fsmul
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl ___fsmul
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
	.area _RSEG (ABS)
	.org 0x0000
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _INITIALIZED
;--------------------------------------------------------
; absolute external ram data
;--------------------------------------------------------
	.area _DABS (ABS)
;--------------------------------------------------------
; global & static initialisations
;--------------------------------------------------------
	.area _CODE
	.area _GSINIT
	.area _GSFINAL
	.area _GSINIT
;--------------------------------------------------------
; Home
;--------------------------------------------------------
	.area _CODE
	.map	src/gpl/_fsmul.c, 56, "float __fsmul (float a1, float a2) {"
;	---------------------------------
; Function __fsmul
; ---------------------------------
___fsmul_start::
___fsmul:
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	hl,#-28
	add	hl,sp
	ld	sp,hl
	.map	src/gpl/_fsmul.c, 62, "fl1.f = a1;"
	ld	hl,#0x000B
	add	hl,sp
	ld	e, l
	ld	d, h
	ld	hl, #0x0020
	add	hl, sp
	ld	bc, #0x0004
	ldir
	.map	src/gpl/_fsmul.c, 63, "fl2.f = a2;"
	ld	hl,#0x0007
	add	hl,sp
	ld	e, l
	ld	d, h
	ld	hl, #0x0024
	add	hl, sp
	ld	bc, #0x0004
	ldir
	.map	src/gpl/_fsmul.c, 65, "if (!fl1.l || !fl2.l)"
	ld	hl,#0x000B
	add	hl,sp
	ld	c,(hl)
	inc	hl
	ld	b,(hl)
	inc	hl
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	a,d
	or	a, e
	or	a, b
	or	a,c
	jp	Z,00101$
	ld	hl,#0x0007
	add	hl,sp
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	inc	hl
	ld	b,(hl)
	inc	hl
	ld	h,(hl)
	ld	a,h
	or	a, b
	or	a, d
	or	a,e
	jp	NZ,00102$
00101$:
	.map	src/gpl/_fsmul.c, 66, "return (0);"
	ld	hl,#0x0000
	ld	e,l
	ld	d,h
	jp	00113$
00102$:
	.map	src/gpl/_fsmul.c, 69, "sign = SIGN (fl1.l) ^ SIGN (fl2.l);"
	ld	hl,#0x000B
	add	hl,sp
	ld	d,(hl)
	inc	hl
	ld	e,(hl)
	inc	hl
	ld	c,(hl)
	inc	hl
	ld	b,(hl)
	ld	a,b
	rlc	a
	and	a,#0x01
	ld	(ix + -5),a
	ld	hl,#0x0007
	add	hl,sp
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	inc	hl
	ld	b,(hl)
	inc	hl
	ld	c,(hl)
	ld	a,c
	rlc	a
	and	a,#0x01
	xor	a, (ix + -5)
	ld	(ix + -28),a
	.map	src/gpl/_fsmul.c, 70, "exp = EXP (fl1.l) - EXCESS;"
	ld	hl,#0x000B
	add	hl,sp
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	inc	hl
	ld	c,(hl)
	inc	hl
	ld	b,(hl)
	ld	a,#0x17
00143$:
	srl	b
	rr	c
	rr	d
	rr	e
	dec	a
	jr	NZ,00143$
	ld	d,#0x00
	ld	bc,#0x0000
	ld	a,e
	add	a,#0x82
	ld	l,a
	ld	a,d
	adc	a,#0xFF
	ld	h,a
	ld	a,c
	adc	a,#0xFF
	ld	d,a
	ld	a,b
	adc	a,#0xFF
	ld	e,a
	ld	(ix + -27),l
	ld	(ix + -26),h
	.map	src/gpl/_fsmul.c, 71, "exp += EXP (fl2.l);"
	ld	hl,#0x0007
	add	hl,sp
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	inc	hl
	ld	c,(hl)
	inc	hl
	ld	b,(hl)
	ld	a,#0x17
00145$:
	srl	b
	rr	c
	rr	d
	rr	e
	dec	a
	jr	NZ,00145$
	ld	(ix + -9),e
	ld	(ix + -8),#0x00
	ld	(ix + -7),#0x00
	ld	(ix + -6),#0x00
	ld	l,(ix + -27)
	ld	h,(ix + -26)
	ld	a,(ix + -26)
	rla
	sbc	a, a
	ld	c,a
	ld	b,a
	ld	a,l
	add	a, (ix + -9)
	ld	l,a
	ld	a,h
	adc	a, (ix + -8)
	ld	h,a
	ld	a,c
	adc	a, (ix + -7)
	ld	d,a
	ld	a,b
	adc	a, (ix + -6)
	ld	e,a
	ld	(ix + -27),l
	ld	(ix + -26),h
	.map	src/gpl/_fsmul.c, 73, "fl1.l = MANT (fl1.l);"
	ld	hl,#0x000B
	add	hl,sp
	ld	(ix + -9),l
	ld	(ix + -8),h
	ld	hl,#0x000B
	add	hl,sp
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	inc	hl
	ld	c,(hl)
	inc	hl
	ld	b,(hl)
	res	7, c
	ld	b,#0x00
	set	7, c
	ld	a, c
	ld	l,(ix + -9)
	ld	h,(ix + -8)
	ld	(hl),e
	inc	hl
	ld	(hl),d
	inc	hl
	ld	(hl),c
	inc	hl
	ld	(hl),b
	.map	src/gpl/_fsmul.c, 74, "fl2.l = MANT (fl2.l);"
	ld	hl,#0x0007
	add	hl,sp
	ld	(ix + -9),l
	ld	(ix + -8),h
	ld	hl,#0x0007
	add	hl,sp
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	inc	hl
	ld	c,(hl)
	inc	hl
	ld	b,(hl)
	res	7, c
	ld	b,#0x00
	set	7, c
	ld	a, c
	ld	l,(ix + -9)
	ld	h,(ix + -8)
	ld	(hl),e
	inc	hl
	ld	(hl),d
	inc	hl
	ld	(hl),c
	inc	hl
	ld	(hl),b
	.map	src/gpl/_fsmul.c, 77, "result = (fl1.l >> 8) * (fl2.l >> 8);"
	ld	hl,#0x000B
	add	hl,sp
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	inc	hl
	ld	c,(hl)
	inc	hl
	ld	b,(hl)
	push	af
	ld	(ix + -9),e
	ld	(ix + -8),d
	ld	(ix + -7),c
	ld	(ix + -6),b
	pop	af
	ld	a,#0x08
00147$:
	srl	(ix + -6)
	rr	(ix + -7)
	rr	(ix + -8)
	rr	(ix + -9)
	dec	a
	jr	NZ,00147$
	ld	hl,#0x0007
	add	hl,sp
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	inc	hl
	ld	c,(hl)
	inc	hl
	ld	b,(hl)
	ld	a,#0x08
00149$:
	srl	b
	rr	c
	rr	d
	rr	e
	dec	a
	jr	NZ,00149$
	push	bc
	push	de
	ld	l,(ix + -7)
	ld	h,(ix + -6)
	push	hl
	ld	l,(ix + -9)
	ld	h,(ix + -8)
	push	hl
	call	__mullong
	pop	af
	pop	af
	pop	af
	pop	af
	ld	(ix + -25),l
	ld	(ix + -24),h
	ld	(ix + -23),e
	ld	(ix + -22),d
	.map	src/gpl/_fsmul.c, 78, "result += ((fl1.l & (unsigned long) 0xFF) * (fl2.l >> 8)) >> 8;"
	ld	hl,#0x000B
	add	hl,sp
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	inc	hl
	ld	c,(hl)
	inc	hl
	ld	b,(hl)
	ld	(ix + -9),e
	ld	(ix + -8),#0x00
	ld	(ix + -7),#0x00
	ld	(ix + -6),#0x00
	ld	hl,#0x0007
	add	hl,sp
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	inc	hl
	ld	c,(hl)
	inc	hl
	ld	b,(hl)
	ld	a,#0x08
00151$:
	srl	b
	rr	c
	rr	d
	rr	e
	dec	a
	jr	NZ,00151$
	push	bc
	push	de
	ld	l,(ix + -7)
	ld	h,(ix + -6)
	push	hl
	ld	l,(ix + -9)
	ld	h,(ix + -8)
	push	hl
	call	__mullong
	pop	af
	pop	af
	pop	af
	pop	af
	ld	b,l
	ld	c,h
	ld	a,#0x08
00153$:
	srl	d
	rr	e
	rr	c
	rr	b
	dec	a
	jr	NZ,00153$
	ld	a,(ix + -25)
	add	a, b
	ld	(ix + -25),a
	ld	a,(ix + -24)
	adc	a, c
	ld	(ix + -24),a
	ld	a,(ix + -23)
	adc	a, e
	ld	(ix + -23),a
	ld	a,(ix + -22)
	adc	a, d
	ld	(ix + -22),a
	.map	src/gpl/_fsmul.c, 79, "result += ((fl2.l & (unsigned long) 0xFF) * (fl1.l >> 8)) >> 8;"
	ld	hl,#0x0007
	add	hl,sp
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	inc	hl
	ld	c,(hl)
	inc	hl
	ld	b,(hl)
	ld	(ix + -9),e
	ld	(ix + -8),#0x00
	ld	(ix + -7),#0x00
	ld	(ix + -6),#0x00
	ld	hl,#0x000B
	add	hl,sp
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	inc	hl
	ld	c,(hl)
	inc	hl
	ld	b,(hl)
	ld	a,#0x08
00155$:
	srl	b
	rr	c
	rr	d
	rr	e
	dec	a
	jr	NZ,00155$
	push	bc
	push	de
	ld	l,(ix + -7)
	ld	h,(ix + -6)
	push	hl
	ld	l,(ix + -9)
	ld	h,(ix + -8)
	push	hl
	call	__mullong
	pop	af
	pop	af
	pop	af
	pop	af
	ld	b,l
	ld	c,h
	ld	a,#0x08
00157$:
	srl	d
	rr	e
	rr	c
	rr	b
	dec	a
	jr	NZ,00157$
	ld	a,(ix + -25)
	add	a, b
	ld	(ix + -25),a
	ld	a,(ix + -24)
	adc	a, c
	ld	(ix + -24),a
	ld	a,(ix + -23)
	adc	a, e
	ld	(ix + -23),a
	ld	a,(ix + -22)
	adc	a, d
	ld	(ix + -22),a
	.map	src/gpl/_fsmul.c, 82, "result += 0x40;"
	ld	a,(ix + -25)
	add	a, #0x40
	ld	(ix + -25),a
	ld	a,(ix + -24)
	adc	a, #0x00
	ld	(ix + -24),a
	ld	a,(ix + -23)
	adc	a, #0x00
	ld	(ix + -23),a
	ld	a,(ix + -22)
	adc	a, #0x00
	ld	(ix + -22),a
	.map	src/gpl/_fsmul.c, 84, "if (result & SIGNBIT)"
	bit	7, (ix + -22)
	jp	Z,00105$
	.map	src/gpl/_fsmul.c, 87, "result += 0x40;"
	ld	a,(ix + -25)
	add	a, #0x40
	ld	(ix + -25),a
	ld	a,(ix + -24)
	adc	a, #0x00
	ld	(ix + -24),a
	ld	a,(ix + -23)
	adc	a, #0x00
	ld	(ix + -23),a
	ld	a,(ix + -22)
	adc	a, #0x00
	ld	(ix + -22),a
	.map	src/gpl/_fsmul.c, 88, "result >>= 8;"
	push	af
	pop	af
	ld	b,#0x08
00160$:
	srl	(ix + -22)
	rr	(ix + -23)
	rr	(ix + -24)
	rr	(ix + -25)
	djnz	00160$
	jp	00106$
00105$:
	.map	src/gpl/_fsmul.c, 92, "result >>= 7;"
	push	af
	pop	af
	ld	b,#0x07
00162$:
	srl	(ix + -22)
	rr	(ix + -23)
	rr	(ix + -24)
	rr	(ix + -25)
	djnz	00162$
	.map	src/gpl/_fsmul.c, 93, "exp--;"
	ld	l,(ix + -27)
	ld	h,(ix + -26)
	dec	hl
	ld	(ix + -27),l
	ld	(ix + -26),h
00106$:
	.map	src/gpl/_fsmul.c, 96, "result &= ~HIDDEN;"
	ld	a,(ix + -23)
	res	7, a
	ld	(ix + -23),a
	.map	src/gpl/_fsmul.c, 99, "if (exp >= 0x100)"
	ld	a,(ix + -26)
	xor	a, #0x80
	sub	a, #0x81
	jp	C,00111$
	.map src/gpl/_fsmul.c, 100, "fl1.l = (sign ? SIGNBIT : 0) | __INFINITY;"
	ld	hl,#0x000B
	add	hl,sp
	ld	a,(ix + -28)
	or	a, a
	jp	Z,00115$
	ld	bc,#0x0000
	ld	de,#0x8000
	jp	00116$
00115$:
	ld	bc,#0x0000
	ld	de,#0x0000
00116$:
	set	7, e
	ld	a, e
	ld	a,d
	or	a, #0x7F
	ld	d,a
	ld	(hl),c
	inc	hl
	ld	(hl),b
	inc	hl
	ld	(hl),e
	inc	hl
	ld	(hl),d
	jp	00112$
00111$:
	.map	src/gpl/_fsmul.c, 101, "else if (exp < 0)"
	bit	7, (ix + -26)
	jp	Z,00108$
	.map	src/gpl/_fsmul.c, 102, "fl1.l = 0;"
	ld	hl,#0x000B
	add	hl,sp
	ld	(hl),#0x00
	inc	hl
	ld	(hl),#0x00
	inc	hl
	ld	(hl),#0x00
	inc	hl
	ld	(hl),#0x00
	jp	00112$
00108$:
	.map src/gpl/_fsmul.c, 104, "fl1.l = PACK (sign ? SIGNBIT : 0 , exp, result);"
	ld	hl,#0x000B
	add	hl,sp
	ld	(ix + -9),l
	ld	(ix + -8),h
	ld	a,(ix + -28)
	or	a, a
	jp	Z,00117$
	ld	(ix + -13),#0x00
	ld	(ix + -12),#0x00
	ld	(ix + -11),#0x00
	ld	(ix + -10),#0x80
	jp	00118$
00117$:
	xor	a, a
	ld	(ix + -13),a
	ld	(ix + -12),a
	ld	(ix + -11),a
	ld	(ix + -10),a
00118$:
	ld	a,(ix + -27)
	ld	(ix + -4),a
	ld	a,(ix + -26)
	ld	(ix + -3),a
	ld	a,(ix + -26)
	rla
	sbc	a, a
	ld	(ix + -2),a
	ld	(ix + -1),a
	push	af
	pop	af
	ld	b,#0x17
00164$:
	sla	(ix + -4)
	rl	(ix + -3)
	rl	(ix + -2)
	rl	(ix + -1)
	djnz	00164$
	ld	a,(ix + -4)
	or	a, (ix + -13)
	ld	(ix + -4),a
	ld	a,(ix + -3)
	or	a, (ix + -12)
	ld	(ix + -3),a
	ld	a,(ix + -2)
	or	a, (ix + -11)
	ld	(ix + -2),a
	ld	a,(ix + -1)
	or	a, (ix + -10)
	ld	(ix + -1),a
	ld	a,(ix + -4)
	or	a, (ix + -25)
	ld	(ix + -4),a
	ld	a,(ix + -3)
	or	a, (ix + -24)
	ld	(ix + -3),a
	ld	a,(ix + -2)
	or	a, (ix + -23)
	ld	(ix + -2),a
	ld	a,(ix + -1)
	or	a, (ix + -22)
	ld	(ix + -1),a
	ld	e,(ix + -9)
	ld	d,(ix + -8)
	ld	hl, #0x0018
	add	hl, sp
	ld	bc, #0x0004
	ldir
00112$:
	.map	src/gpl/_fsmul.c, 105, "return (fl1.f);"
	ld	hl,#0x000B
	add	hl,sp
	ld	b,(hl)
	inc	hl
	ld	c,(hl)
	inc	hl
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	l,b
	ld	h,c
00113$:
	ld	sp, ix
	pop	ix
	ret
	___fsmul_end::
.function	___fsmul, ___fsmul_start, ___fsmul_end
	.area _CODE
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area _CODE
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
