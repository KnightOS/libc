;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.4.1 #9072 (Jan 24 2019) (Linux)
; This file was generated Thu Jan 24 08:46:17 2019
;--------------------------------------------------------
	.module _fsadd
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl ___fsadd
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
	.map	src/gpl/_fsadd.c, 57, "float __fsadd (float a1, float a2)"
;	---------------------------------
; Function __fsadd
; ---------------------------------
___fsadd_start::
___fsadd:
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	hl,#-37
	add	hl,sp
	ld	sp,hl
	.map	src/gpl/_fsadd.c, 65, "pfl2 = (long _AUTOMEM *)&a2;"
	ld	hl,#0x002D
	add	hl,sp
	ld	(ix + -2),l
	ld	(ix + -1),h
	ld	a,(ix + -2)
	ld	(ix + -30),a
	ld	a,(ix + -1)
	ld	(ix + -29),a
	.map	src/gpl/_fsadd.c, 66, "exp2 = EXP (*pfl2);"
	ld	e,(ix + -30)
	ld	d,(ix + -29)
	ld	hl, #0x001F
	add	hl, sp
	ex	de, hl
	ld	bc, #0x0004
	ldir
	ld	hl, #19
	add	hl, sp
	ex	de, hl
	ld	hl, #31
	add	hl, sp
	ld	bc, #4
	ldir
	push	af
	ld	l,(ix + -18)
	ld	h,(ix + -17)
	ld	d,(ix + -16)
	ld	c,(ix + -15)
	pop	af
	ld	b,#0x17
00221$:
	srl	c
	rr	d
	rr	h
	rr	l
	djnz	00221$
	ld	h,#0x00
	ld	de,#0x0000
	ld	(ix + -34),l
	ld	(ix + -33),h
	.map	src/gpl/_fsadd.c, 67, "mant2 = MANT (*pfl2) << 4;"
	ld	e,(ix + -18)
	ld	d,(ix + -17)
	ld	c,(ix + -16)
	res	7, c
	ld	b,#0x00
	set	7, c
	ld	a, c
	ld	a,#0x04
00223$:
	sla	e
	rl	d
	rl	c
	rl	b
	dec	a
	jr	NZ,00223$
	ld	(ix + -26),e
	ld	(ix + -25),d
	ld	(ix + -24),c
	ld	(ix + -23),b
	.map	src/gpl/_fsadd.c, 68, "if (SIGN (*pfl2))"
	ld	a,(ix + -15)
	rlc	a
	and	a,#0x01
	jp	Z,00102$
	.map	src/gpl/_fsadd.c, 69, "mant2 = -mant2;"
	xor	a, a
	sub	a, e
	ld	h,a
	ld	a, #0x00
	sbc	a, d
	ld	l,a
	ld	a, #0x00
	sbc	a, c
	ld	d,a
	ld	a, #0x00
	sbc	a, b
	ld	e,a
	ld	(ix + -26),h
	ld	(ix + -25),l
	ld	(ix + -24),d
	ld	(ix + -23),e
00102$:
	.map	src/gpl/_fsadd.c, 71, "if (!*pfl2)"
	ld	a,(ix + -3)
	or	a, (ix + -4)
	or	a, (ix + -5)
	or	a,(ix + -6)
	jp	NZ,00104$
	.map	src/gpl/_fsadd.c, 72, "return (a1);"
	ld	l,(ix + 4)
	ld	h,(ix + 5)
	ld	e,(ix + 6)
	ld	d,(ix + 7)
	jp	00137$
00104$:
	.map	src/gpl/_fsadd.c, 74, "pfl1 = (long _AUTOMEM *)&a1;"
	ld	hl,#0x0029
	add	hl,sp
	ld	(ix + -18),l
	ld	(ix + -17),h
	ld	a,(ix + -18)
	ld	(ix + -28),a
	ld	a,(ix + -17)
	ld	(ix + -27),a
	.map	src/gpl/_fsadd.c, 75, "exp1 = EXP (*pfl1);"
	ld	e,(ix + -28)
	ld	d,(ix + -27)
	ld	hl, #0x0013
	add	hl, sp
	ex	de, hl
	ld	bc, #0x0004
	ldir
	ld	hl, #31
	add	hl, sp
	ex	de, hl
	ld	hl, #19
	add	hl, sp
	ld	bc, #4
	ldir
	push	af
	ld	a,(ix + -6)
	ld	(ix + -14),a
	ld	a,(ix + -5)
	ld	(ix + -13),a
	ld	a,(ix + -4)
	ld	(ix + -12),a
	ld	a,(ix + -3)
	ld	(ix + -11),a
	pop	af
	ld	b,#0x17
00225$:
	srl	(ix + -11)
	rr	(ix + -12)
	rr	(ix + -13)
	rr	(ix + -14)
	djnz	00225$
	ld	(ix + -13),#0x00
	ld	(ix + -12),#0x00
	ld	(ix + -11),#0x00
	ld	a,(ix + -14)
	ld	(ix + -14),a
	ld	a,(ix + -13)
	ld	(ix + -13),a
	.map	src/gpl/_fsadd.c, 76, "mant1 = MANT (*pfl1) << 4;"
	ld	a,(ix + -6)
	ld	(ix + -10),a
	ld	a,(ix + -5)
	ld	(ix + -9),a
	ld	a,(ix + -4)
	and	a, #0x7F
	ld	(ix + -8),a
	ld	(ix + -7),#0x00
	ld	a,(ix + -8)
	set	7, a
	ld	(ix + -8),a
	push	af
	pop	af
	ld	b,#0x04
00227$:
	sla	(ix + -10)
	rl	(ix + -9)
	rl	(ix + -8)
	rl	(ix + -7)
	djnz	00227$
	ld	hl, #15
	add	hl, sp
	ex	de, hl
	ld	hl, #27
	add	hl, sp
	ld	bc, #4
	ldir
	.map	src/gpl/_fsadd.c, 77, "if (SIGN(*pfl1))"
	ld	a,(ix + -3)
	rlc	a
	and	a,#0x01
	jp	Z,00108$
	.map	src/gpl/_fsadd.c, 78, "if (*pfl1 & 0x80000000)"
	bit	7, (ix + -3)
	jp	Z,00108$
	.map	src/gpl/_fsadd.c, 79, "mant1 = -mant1;"
	xor	a, a
	sub	a, (ix + -10)
	ld	h,a
	ld	a, #0x00
	sbc	a, (ix + -9)
	ld	l,a
	ld	a, #0x00
	sbc	a, (ix + -8)
	ld	e,a
	ld	a, #0x00
	sbc	a, (ix + -7)
	ld	d,a
	ld	(ix + -22),h
	ld	(ix + -21),l
	ld	(ix + -20),e
	ld	(ix + -19),d
00108$:
	.map	src/gpl/_fsadd.c, 81, "if (!*pfl1)"
	ld	a,(ix + -15)
	or	a, (ix + -16)
	or	a, (ix + -17)
	or	a,(ix + -18)
	jp	NZ,00110$
	.map	src/gpl/_fsadd.c, 82, "return (a2);"
	ld	l,(ix + 8)
	ld	h,(ix + 9)
	ld	e,(ix + 10)
	ld	d,(ix + 11)
	jp	00137$
00110$:
	.map	src/gpl/_fsadd.c, 84, "expd = exp1 - exp2;"
	ld	a,(ix + -14)
	sub	a, (ix + -34)
	ld	(ix + -10),a
	ld	a,(ix + -13)
	sbc	a, (ix + -33)
	ld	(ix + -9),a
	.map	src/gpl/_fsadd.c, 85, "if (expd > 25)"
	ld	a,#0x19
	cp	a, (ix + -10)
	ld	a,#0x00
	sbc	a, (ix + -9)
	jp	PO, 00230$
	xor	a, #0x80
00230$:
	jp	P,00112$
	.map	src/gpl/_fsadd.c, 86, "return (a1);"
	ld	l,(ix + 4)
	ld	h,(ix + 5)
	ld	e,(ix + 6)
	ld	d,(ix + 7)
	jp	00137$
00112$:
	.map	src/gpl/_fsadd.c, 87, "if (expd < -25)"
	ld	a,(ix + -10)
	sub	a, #0xE7
	ld	a,(ix + -9)
	rla
	ccf
	rra
	sbc	a, #0x7F
	jp	NC,00114$
	.map	src/gpl/_fsadd.c, 88, "return (a2);"
	ld	l,(ix + 8)
	ld	h,(ix + 9)
	ld	e,(ix + 10)
	ld	d,(ix + 11)
	jp	00137$
00114$:
	.map	src/gpl/_fsadd.c, 90, "if (expd < 0)"
	bit	7, (ix + -9)
	jp	Z,00116$
	.map	src/gpl/_fsadd.c, 92, "expd = -expd;"
	xor	a, a
	sub	a, (ix + -10)
	ld	(ix + -18),a
	ld	a, #0x00
	sbc	a, (ix + -9)
	ld	(ix + -17),a
	ld	a,(ix + -18)
	ld	(ix + -36),a
	ld	a,(ix + -17)
	ld	(ix + -35),a
	.map	src/gpl/_fsadd.c, 93, "exp1 += expd;"
	ld	a,(ix + -14)
	add	a, (ix + -36)
	ld	(ix + -14),a
	ld	a,(ix + -13)
	adc	a, (ix + -35)
	ld	(ix + -13),a
	.map	src/gpl/_fsadd.c, 94, "mant1 >>= expd;"
	ld	b,(ix + -36)
	push	af
	pop	af
	inc	b
	jp	00232$
00231$:
	sra	(ix + -19)
	rr	(ix + -20)
	rr	(ix + -21)
	rr	(ix + -22)
00232$:
	djnz	00231$
	jp	00117$
00116$:
	.map	src/gpl/_fsadd.c, 98, "mant2 >>= expd;"
	ld	b,(ix + -10)
	push	af
	pop	af
	inc	b
	jp	00234$
00233$:
	sra	(ix + -23)
	rr	(ix + -24)
	rr	(ix + -25)
	rr	(ix + -26)
00234$:
	djnz	00233$
00117$:
	.map	src/gpl/_fsadd.c, 100, "mant1 += mant2;"
	ld	a,(ix + -22)
	add	a, (ix + -26)
	ld	(ix + -22),a
	ld	a,(ix + -21)
	adc	a, (ix + -25)
	ld	(ix + -21),a
	ld	a,(ix + -20)
	adc	a, (ix + -24)
	ld	(ix + -20),a
	ld	a,(ix + -19)
	adc	a, (ix + -23)
	ld	(ix + -19),a
	.map	src/gpl/_fsadd.c, 102, "sign = false;"
	ld	(ix + -37),#0x00
	.map	src/gpl/_fsadd.c, 104, "if (mant1 < 0)"
	bit	7, (ix + -19)
	jp	Z,00121$
	.map	src/gpl/_fsadd.c, 106, "mant1 = -mant1;"
	xor	a, a
	sub	a, (ix + -22)
	ld	(ix + -22),a
	ld	a, #0x00
	sbc	a, (ix + -21)
	ld	(ix + -21),a
	ld	a, #0x00
	sbc	a, (ix + -20)
	ld	(ix + -20),a
	ld	a, #0x00
	sbc	a, (ix + -19)
	ld	(ix + -19),a
	.map	src/gpl/_fsadd.c, 107, "sign = true;"
	ld	(ix + -37),#0x01
	jp	00154$
00121$:
	.map	src/gpl/_fsadd.c, 109, "else if (!mant1)"
	ld	a,(ix + -19)
	or	a, (ix + -20)
	or	a, (ix + -21)
	or	a,(ix + -22)
	jp	NZ,00154$
	.map	src/gpl/_fsadd.c, 110, "return (0);"
	ld	hl,#0x0000
	ld	e,l
	ld	d,h
	jp	00137$
	.map	src/gpl/_fsadd.c, 113, "while (mant1 < (HIDDEN<<4)) {"
00154$:
	ld	a,(ix + -14)
	ld	(ix + -10),a
	ld	a,(ix + -13)
	ld	(ix + -9),a
00123$:
	ld	hl, #23
	add	hl, sp
	ex	de, hl
	ld	hl, #15
	add	hl, sp
	ld	bc, #4
	ldir
	ld	a,(ix + -11)
	sub	a, #0x08
	jp	NC,00157$
	.map	src/gpl/_fsadd.c, 114, "mant1 <<= 1;"
	push	af
	pop	af
	ld	b,#0x01
	sla	(ix + -22)
	rl	(ix + -21)
	rl	(ix + -20)
	rl	(ix + -19)
	.map	src/gpl/_fsadd.c, 115, "exp1--;"
	ld	l,(ix + -10)
	ld	h,(ix + -9)
	dec	hl
	ld	(ix + -10),l
	ld	(ix + -9),h
	jp	00123$
	.map	src/gpl/_fsadd.c, 119, "while (mant1 & 0xf0000000) {"
00157$:
	ld	a,(ix + -10)
	ld	(ix + -32),a
	ld	a,(ix + -9)
	ld	(ix + -31),a
00128$:
	ld	hl, #27
	add	hl, sp
	ex	de, hl
	ld	hl, #15
	add	hl, sp
	ld	bc, #4
	ldir
	ld	a,(ix + -7)
	and	a, #0xF0
	jp	Z,00163$
	.map	src/gpl/_fsadd.c, 120, "if (mant1&1)"
	bit	0, (ix + -22)
	jp	Z,00127$
	.map	src/gpl/_fsadd.c, 121, "mant1 += 2;"
	ld	a,(ix + -22)
	add	a, #0x02
	ld	(ix + -22),a
	ld	a,(ix + -21)
	adc	a, #0x00
	ld	(ix + -21),a
	ld	a,(ix + -20)
	adc	a, #0x00
	ld	(ix + -20),a
	ld	a,(ix + -19)
	adc	a, #0x00
	ld	(ix + -19),a
00127$:
	.map	src/gpl/_fsadd.c, 122, "mant1 >>= 1;"
	push	af
	pop	af
	ld	b,#0x01
	sra	(ix + -19)
	rr	(ix + -20)
	rr	(ix + -21)
	rr	(ix + -22)
	.map	src/gpl/_fsadd.c, 123, "exp1++;"
	inc	(ix + -32)
	jp	NZ,00128$
	inc	(ix + -31)
	jp	00128$
00163$:
	ld	a,(ix + -32)
	ld	(ix + -14),a
	ld	a,(ix + -31)
	ld	(ix + -13),a
	.map	src/gpl/_fsadd.c, 127, "mant1 &= ~(HIDDEN<<4);"
	ld	a,(ix + -10)
	ld	(ix + -22),a
	ld	a,(ix + -9)
	ld	(ix + -21),a
	ld	a,(ix + -8)
	ld	(ix + -20),a
	ld	a,(ix + -7)
	and	a, #0xF7
	ld	(ix + -19),a
	.map	src/gpl/_fsadd.c, 130, "if (exp1 >= 0x100)"
	ld	a,(ix + -31)
	xor	a, #0x80
	sub	a, #0x81
	jp	C,00135$
	.map src/gpl/_fsadd.c, 131, "*pfl1 = (sign ? (SIGNBIT | __INFINITY) : __INFINITY);"
	bit	0,(ix + -37)
	jp	Z,00139$
	ld	(ix + -10),#0x00
	ld	(ix + -9),#0x00
	ld	(ix + -8),#0x80
	ld	(ix + -7),#0xFF
	jp	00140$
00139$:
	ld	(ix + -10),#0x00
	ld	(ix + -9),#0x00
	ld	(ix + -8),#0x80
	ld	(ix + -7),#0x7F
00140$:
	ld	e,(ix + -28)
	ld	d,(ix + -27)
	ld	hl, #0x001B
	add	hl, sp
	ld	bc, #0x0004
	ldir
	jp	00136$
00135$:
	.map	src/gpl/_fsadd.c, 132, "else if (exp1 < 0)"
	bit	7, (ix + -31)
	jp	Z,00132$
	.map	src/gpl/_fsadd.c, 133, "*pfl1 = 0;"
	ld	l,(ix + -28)
	ld	h,(ix + -27)
	ld	(hl),#0x00
	inc	hl
	ld	(hl),#0x00
	inc	hl
	ld	(hl),#0x00
	inc	hl
	ld	(hl),#0x00
	jp	00136$
00132$:
	.map src/gpl/_fsadd.c, 135, "*pfl1 = PACK (sign ? SIGNBIT : 0 , exp1, mant1>>4);"
	bit	0,(ix + -37)
	jp	Z,00141$
	ld	(ix + -10),#0x00
	ld	(ix + -9),#0x00
	ld	(ix + -8),#0x00
	ld	(ix + -7),#0x80
	jp	00142$
00141$:
	xor	a, a
	ld	(ix + -10),a
	ld	(ix + -9),a
	ld	(ix + -8),a
	ld	(ix + -7),a
00142$:
	ld	l,(ix + -14)
	ld	h,(ix + -13)
	ld	a,(ix + -13)
	rla
	sbc	a, a
	ld	e,a
	ld	d,a
	ld	b,#0x17
00242$:
	add	hl, hl
	rl	e
	rl	d
	djnz	00242$
	ld	a,(ix + -10)
	or	a, l
	ld	(ix + -10),a
	ld	a,(ix + -9)
	or	a, h
	ld	(ix + -9),a
	ld	a,(ix + -8)
	or	a, e
	ld	(ix + -8),a
	ld	a,(ix + -7)
	or	a, d
	ld	(ix + -7),a
	push	af
	ld	e,(ix + -22)
	ld	d,(ix + -21)
	ld	l,(ix + -20)
	ld	h,(ix + -19)
	pop	af
	ld	b,#0x04
00244$:
	sra	h
	rr	l
	rr	d
	rr	e
	djnz	00244$
	ld	a,(ix + -10)
	or	a, e
	ld	e,a
	ld	a,(ix + -9)
	or	a, d
	ld	d,a
	ld	a,(ix + -8)
	or	a, l
	ld	c,a
	ld	a,(ix + -7)
	or	a, h
	ld	b,a
	ld	l,(ix + -28)
	ld	h,(ix + -27)
	ld	(hl),e
	inc	hl
	ld	(hl),d
	inc	hl
	ld	(hl),c
	inc	hl
	ld	(hl),b
00136$:
	.map	src/gpl/_fsadd.c, 136, "return (a1);"
	ld	l,(ix + 4)
	ld	h,(ix + 5)
	ld	e,(ix + 6)
	ld	d,(ix + 7)
00137$:
	ld	sp, ix
	pop	ix
	ret
	___fsadd_end::
.function	___fsadd, ___fsadd_start, ___fsadd_end
	.area _CODE
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area _CODE
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
