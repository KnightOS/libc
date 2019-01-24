;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.4.1 #9072 (Jan 24 2019) (Linux)
; This file was generated Thu Jan 24 08:46:16 2019
;--------------------------------------------------------
	.module _fs2ulong
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl ___fs2ulong
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
	.map	src/gpl/_fs2ulong.c, 58, "__fs2ulong (float a1)"
;	---------------------------------
; Function __fs2ulong
; ---------------------------------
___fs2ulong_start::
___fs2ulong:
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	hl,#-10
	add	hl,sp
	ld	sp,hl
	.map	src/gpl/_fs2ulong.c, 64, "fl1.f = a1;"
	ld	hl,#0x0006
	add	hl,sp
	ld	e, l
	ld	d, h
	ld	hl, #0x000E
	add	hl, sp
	ld	bc, #0x0004
	ldir
	.map	src/gpl/_fs2ulong.c, 66, "if (!fl1.l || SIGN(fl1.l))"
	ld	hl,#0x0006
	add	hl,sp
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	inc	hl
	ld	c,(hl)
	inc	hl
	ld	b,(hl)
	ld	a,b
	or	a, c
	or	a, d
	or	a,e
	jp	Z,00101$
	ld	hl,#0x0006
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
	jp	Z,00102$
00101$:
	.map	src/gpl/_fs2ulong.c, 67, "return (0);"
	ld	hl,#0x0000
	ld	e,l
	ld	d,h
	jp	00104$
00102$:
	.map	src/gpl/_fs2ulong.c, 69, "exp = EXP (fl1.l) - EXCESS - 24;"
	ld	hl,#0x0006
	add	hl,sp
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	inc	hl
	ld	c,(hl)
	inc	hl
	ld	b,(hl)
	ld	a,#0x17
00110$:
	srl	b
	rr	c
	rr	d
	rr	e
	dec	a
	jr	NZ,00110$
	ld	d,#0x00
	ld	bc,#0x0000
	ld	a,e
	add	a,#0x6A
	ld	l,a
	ld	a,d
	adc	a,#0xFF
	ld	h,a
	ld	a,c
	adc	a,#0xFF
	ld	e,a
	ld	a,b
	adc	a,#0xFF
	ld	d,a
	ld	(ix + -6),l
	ld	(ix + -5),h
	.map	src/gpl/_fs2ulong.c, 70, "l = MANT (fl1.l);"
	ld	hl,#0x0006
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
	ld	(ix + -10),e
	ld	(ix + -9),d
	ld	a,c
	set	7, a
	ld	(ix + -8),a
	ld	(ix + -7),b
	.map	src/gpl/_fs2ulong.c, 72, "l >>= -exp;"
	xor	a, a
	sub	a, (ix + -6)
	ld	b,a
	ld	a, #0x00
	sbc	a, (ix + -5)
	ld	h,a
	push	af
	pop	af
	inc	b
	jp	00113$
00112$:
	sra	(ix + -7)
	rr	(ix + -8)
	rr	(ix + -9)
	rr	(ix + -10)
00113$:
	djnz	00112$
	.map	src/gpl/_fs2ulong.c, 74, "return l;"
	ld	l,(ix + -10)
	ld	h,(ix + -9)
	ld	e,(ix + -8)
	ld	d,(ix + -7)
00104$:
	ld	sp, ix
	pop	ix
	ret
	___fs2ulong_end::
.function	___fs2ulong, ___fs2ulong_start, ___fs2ulong_end
	.area _CODE
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area _CODE
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
