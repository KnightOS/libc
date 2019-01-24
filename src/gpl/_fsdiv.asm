;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.4.1 #9072 (Jan 24 2019) (Linux)
; This file was generated Thu Jan 24 08:46:18 2019
;--------------------------------------------------------
	.module _fsdiv
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl ___fsdiv
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
	.map	src/gpl/_fsdiv.c, 56, "float __fsdiv (float a1, float a2)"
;	---------------------------------
; Function __fsdiv
; ---------------------------------
___fsdiv_start::
___fsdiv:
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	hl,#-35
	add	hl,sp
	ld	sp,hl
	.map	src/gpl/_fsdiv.c, 65, "fl1.f = a1;"
	ld	hl,#0x0017
	add	hl,sp
	ld	e, l
	ld	d, h
	ld	hl, #0x0027
	add	hl, sp
	ld	bc, #0x0004
	ldir
	.map	src/gpl/_fsdiv.c, 66, "fl2.f = a2;"
	ld	hl,#0x0013
	add	hl,sp
	ld	e, l
	ld	d, h
	ld	hl, #0x002B
	add	hl, sp
	ld	bc, #0x0004
	ldir
	.map	src/gpl/_fsdiv.c, 69, "exp = EXP (fl1.l) ;"
	ld	hl,#0x0017
	add	hl,sp
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	inc	hl
	ld	c,(hl)
	inc	hl
	ld	b,(hl)
	ld	a,#0x17
00164$:
	srl	b
	rr	c
	rr	d
	rr	e
	dec	a
	jr	NZ,00164$
	ld	d,#0x00
	ld	hl,#0x0000
	ld	(ix + -34),e
	ld	(ix + -33),d
	.map	src/gpl/_fsdiv.c, 70, "exp -= EXP (fl2.l);"
	ld	hl,#0x0013
	add	hl,sp
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	inc	hl
	ld	c,(hl)
	inc	hl
	ld	b,(hl)
	ld	a,#0x17
00166$:
	srl	b
	rr	c
	rr	d
	rr	e
	dec	a
	jr	NZ,00166$
	ld	(ix + -8),e
	ld	(ix + -7),#0x00
	ld	(ix + -6),#0x00
	ld	(ix + -5),#0x00
	ld	l,(ix + -34)
	ld	h,(ix + -33)
	ld	a,(ix + -33)
	rla
	sbc	a, a
	ld	c,a
	ld	b,a
	ld	a,l
	sub	a, (ix + -8)
	ld	l,a
	ld	a,h
	sbc	a, (ix + -7)
	ld	h,a
	ld	a,c
	sbc	a, (ix + -6)
	ld	d,a
	ld	a,b
	sbc	a, (ix + -5)
	ld	e,a
	ld	(ix + -34),l
	ld	(ix + -33),h
	.map	src/gpl/_fsdiv.c, 71, "exp += EXCESS;"
	ld	a,(ix + -34)
	add	a, #0x7E
	ld	(ix + -34),a
	ld	a,(ix + -33)
	adc	a, #0x00
	ld	(ix + -33),a
	.map	src/gpl/_fsdiv.c, 74, "sign = SIGN (fl1.l) ^ SIGN (fl2.l);"
	ld	hl,#0x0017
	add	hl,sp
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	inc	hl
	ld	c,(hl)
	inc	hl
	ld	b,(hl)
	ld	a,b
	rlc	a
	and	a,#0x01
	ld	(ix + -8),a
	ld	hl,#0x0013
	add	hl,sp
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	inc	hl
	ld	c,(hl)
	inc	hl
	ld	b,(hl)
	ld	a,b
	rlc	a
	and	a,#0x01
	xor	a, (ix + -8)
	ld	(ix + -35),a
	.map	src/gpl/_fsdiv.c, 77, "if (!fl2.l)"
	ld	hl,#0x0013
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
	jp	NZ,00102$
	.map	src/gpl/_fsdiv.c, 79, "fl2.l = 0x7FC00000;"
	ld	hl,#0x0013
	add	hl,sp
	ld	(hl),#0x00
	inc	hl
	ld	(hl),#0x00
	inc	hl
	ld	(hl),#0xC0
	inc	hl
	ld	(hl),#0x7F
	.map	src/gpl/_fsdiv.c, 80, "return (fl2.f);"
	ld	hl,#0x0013
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
	jp	00118$
00102$:
	.map	src/gpl/_fsdiv.c, 84, "if (!fl1.l)"
	ld	hl,#0x0017
	add	hl,sp
	ld	d,(hl)
	inc	hl
	ld	e,(hl)
	inc	hl
	ld	c,(hl)
	inc	hl
	ld	h,(hl)
	ld	a,h
	or	a, c
	or	a, e
	or	a,d
	jp	NZ,00104$
	.map	src/gpl/_fsdiv.c, 85, "return (0);"
	ld	hl,#0x0000
	ld	e,l
	ld	d,h
	jp	00118$
00104$:
	.map	src/gpl/_fsdiv.c, 88, "mant1 = MANT (fl1.l);"
	ld	hl,#0x0017
	add	hl,sp
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	inc	hl
	ld	c,(hl)
	inc	hl
	ld	b,(hl)
	res	7, c
	ld	h,#0x00
	ld	(ix + -28),e
	ld	(ix + -27),d
	ld	a,c
	set	7, a
	ld	(ix + -26),a
	ld	(ix + -25),h
	.map	src/gpl/_fsdiv.c, 89, "mant2 = MANT (fl2.l);"
	ld	hl,#0x0013
	add	hl,sp
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	inc	hl
	ld	c,(hl)
	inc	hl
	ld	b,(hl)
	res	7, c
	ld	h,#0x00
	ld	(ix + -32),e
	ld	(ix + -31),d
	ld	a,c
	set	7, a
	ld	(ix + -30),a
	ld	(ix + -29),h
	.map	src/gpl/_fsdiv.c, 92, "if (mant1 < mant2)"
	ld	a,(ix + -28)
	sub	a, (ix + -32)
	ld	a,(ix + -27)
	sbc	a, (ix + -31)
	ld	a,(ix + -26)
	sbc	a, (ix + -30)
	ld	a,(ix + -25)
	sbc	a, (ix + -29)
	jp	PO, 00168$
	xor	a, #0x80
00168$:
	jp	P,00106$
	.map	src/gpl/_fsdiv.c, 94, "mant1 <<= 1;"
	push	af
	pop	af
	ld	b,#0x01
	sla	(ix + -28)
	rl	(ix + -27)
	rl	(ix + -26)
	rl	(ix + -25)
	.map	src/gpl/_fsdiv.c, 95, "exp--;"
	ld	l,(ix + -34)
	ld	h,(ix + -33)
	dec	hl
	ld	(ix + -34),l
	ld	(ix + -33),h
00106$:
	.map	src/gpl/_fsdiv.c, 99, "mask = 0x1000000;"
	ld	(ix + -24),#0x00
	ld	(ix + -23),#0x00
	ld	(ix + -22),#0x00
	ld	(ix + -21),#0x01
	.map	src/gpl/_fsdiv.c, 100, "result = 0;"
	xor	a, a
	ld	(ix + -20),a
	ld	(ix + -19),a
	ld	(ix + -18),a
	ld	(ix + -17),a
	.map	src/gpl/_fsdiv.c, 101, "while (mask)"
00109$:
	ld	a,(ix + -21)
	or	a, (ix + -22)
	or	a, (ix + -23)
	or	a,(ix + -24)
	jp	Z,00111$
	.map	src/gpl/_fsdiv.c, 103, "if (mant1 >= mant2)"
	ld	a,(ix + -28)
	sub	a, (ix + -32)
	ld	a,(ix + -27)
	sbc	a, (ix + -31)
	ld	a,(ix + -26)
	sbc	a, (ix + -30)
	ld	a,(ix + -25)
	sbc	a, (ix + -29)
	jp	PO, 00171$
	xor	a, #0x80
00171$:
	jp	M,00108$
	.map	src/gpl/_fsdiv.c, 105, "result |= mask;"
	ld	l,(ix + -20)
	ld	h,(ix + -19)
	ld	d,(ix + -18)
	ld	e,(ix + -17)
	ld	a,l
	or	a, (ix + -24)
	ld	l,a
	ld	a,h
	or	a, (ix + -23)
	ld	h,a
	ld	a,d
	or	a, (ix + -22)
	ld	c,a
	ld	a,e
	or	a, (ix + -21)
	ld	b,a
	ld	(ix + -20),l
	ld	(ix + -19),h
	ld	(ix + -18),c
	ld	(ix + -17),b
	.map	src/gpl/_fsdiv.c, 106, "mant1 -= mant2;"
	ld	a,(ix + -28)
	sub	a, (ix + -32)
	ld	(ix + -28),a
	ld	a,(ix + -27)
	sbc	a, (ix + -31)
	ld	(ix + -27),a
	ld	a,(ix + -26)
	sbc	a, (ix + -30)
	ld	(ix + -26),a
	ld	a,(ix + -25)
	sbc	a, (ix + -29)
	ld	(ix + -25),a
00108$:
	.map	src/gpl/_fsdiv.c, 108, "mant1 <<= 1;"
	push	af
	pop	af
	ld	b,#0x01
	sla	(ix + -28)
	rl	(ix + -27)
	rl	(ix + -26)
	rl	(ix + -25)
	.map	src/gpl/_fsdiv.c, 109, "mask >>= 1;"
	push	af
	pop	af
	ld	b,#0x01
	srl	(ix + -21)
	rr	(ix + -22)
	rr	(ix + -23)
	rr	(ix + -24)
	jp	00109$
00111$:
	.map	src/gpl/_fsdiv.c, 113, "result += 1;"
	inc	(ix + -20)
	jp	NZ,00176$
	inc	(ix + -19)
	jp	NZ,00176$
	inc	(ix + -18)
	jp	NZ,00176$
	inc	(ix + -17)
00176$:
	.map	src/gpl/_fsdiv.c, 116, "exp++;"
	inc	(ix + -34)
	jp	NZ,00177$
	inc	(ix + -33)
00177$:
	.map	src/gpl/_fsdiv.c, 117, "result >>= 1;"
	push	af
	pop	af
	ld	b,#0x01
	sra	(ix + -17)
	rr	(ix + -18)
	rr	(ix + -19)
	rr	(ix + -20)
	.map	src/gpl/_fsdiv.c, 119, "result &= ~HIDDEN;"
	ld	h,(ix + -20)
	ld	l,(ix + -19)
	ld	d,(ix + -18)
	ld	e,(ix + -17)
	ld	(ix + -20),h
	ld	(ix + -19),l
	ld	a,d
	and	a, #0x7F
	ld	(ix + -18),a
	ld	(ix + -17),e
	.map	src/gpl/_fsdiv.c, 122, "if (exp >= 0x100)"
	ld	a,(ix + -33)
	xor	a, #0x80
	sub	a, #0x81
	jp	C,00116$
	.map src/gpl/_fsdiv.c, 123, "fl1.l = (sign ? SIGNBIT : 0) | __INFINITY;"
	ld	hl,#0x0017
	add	hl,sp
	ld	a,(ix + -35)
	or	a, a
	jp	Z,00120$
	ld	bc,#0x0000
	ld	de,#0x8000
	jp	00121$
00120$:
	ld	bc,#0x0000
	ld	de,#0x0000
00121$:
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
	jp	00117$
00116$:
	.map	src/gpl/_fsdiv.c, 124, "else if (exp < 0)"
	bit	7, (ix + -33)
	jp	Z,00113$
	.map	src/gpl/_fsdiv.c, 125, "fl1.l = 0;"
	ld	hl,#0x0017
	add	hl,sp
	ld	(hl),#0x00
	inc	hl
	ld	(hl),#0x00
	inc	hl
	ld	(hl),#0x00
	inc	hl
	ld	(hl),#0x00
	jp	00117$
00113$:
	.map src/gpl/_fsdiv.c, 127, "fl1.l = PACK (sign ? SIGNBIT : 0 , exp, result);"
	ld	hl,#0x0017
	add	hl,sp
	ld	(ix + -8),l
	ld	(ix + -7),h
	ld	a,(ix + -35)
	or	a, a
	jp	Z,00122$
	ld	(ix + -4),#0x00
	ld	(ix + -3),#0x00
	ld	(ix + -2),#0x00
	ld	(ix + -1),#0x80
	jp	00123$
00122$:
	xor	a, a
	ld	(ix + -4),a
	ld	(ix + -3),a
	ld	(ix + -2),a
	ld	(ix + -1),a
00123$:
	ld	l,(ix + -34)
	ld	h,(ix + -33)
	ld	a,(ix + -33)
	rla
	sbc	a, a
	ld	e,a
	ld	d,a
	ld	b,#0x17
00180$:
	add	hl, hl
	rl	e
	rl	d
	djnz	00180$
	ld	a,(ix + -4)
	or	a, l
	ld	(ix + -4),a
	ld	a,(ix + -3)
	or	a, h
	ld	(ix + -3),a
	ld	a,(ix + -2)
	or	a, e
	ld	(ix + -2),a
	ld	a,(ix + -1)
	or	a, d
	ld	(ix + -1),a
	ld	e,(ix + -20)
	ld	d,(ix + -19)
	ld	l,(ix + -18)
	ld	h,(ix + -17)
	ld	a,(ix + -4)
	or	a, e
	ld	e,a
	ld	a,(ix + -3)
	or	a, d
	ld	d,a
	ld	a,(ix + -2)
	or	a, l
	ld	b,a
	ld	a,(ix + -1)
	or	a, h
	ld	c,a
	ld	l,(ix + -8)
	ld	h,(ix + -7)
	ld	(hl),e
	inc	hl
	ld	(hl),d
	inc	hl
	ld	(hl),b
	inc	hl
	ld	(hl),c
00117$:
	.map	src/gpl/_fsdiv.c, 128, "return (fl1.f);"
	ld	hl,#0x0017
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
00118$:
	ld	sp, ix
	pop	ix
	ret
	___fsdiv_end::
.function	___fsdiv, ___fsdiv_start, ___fsdiv_end
	.area _CODE
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area _CODE
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
