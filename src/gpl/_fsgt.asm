;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.4.1 #9072 (Jan 24 2019) (Linux)
; This file was generated Thu Jan 24 08:46:15 2019
;--------------------------------------------------------
	.module _fsgt
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl ___fsgt
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
	.map	src/gpl/_fsgt.c, 56, "char __fsgt (float a1, float a2)"
;	---------------------------------
; Function __fsgt
; ---------------------------------
___fsgt_start::
___fsgt:
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	hl,#-12
	add	hl,sp
	ld	sp,hl
	.map	src/gpl/_fsgt.c, 60, "fl1.f = a1;"
	ld	hl,#0x0004
	add	hl,sp
	ld	e, l
	ld	d, h
	ld	hl, #0x0010
	add	hl, sp
	ld	bc, #0x0004
	ldir
	.map	src/gpl/_fsgt.c, 61, "fl2.f = a2;"
	ld	hl,#0x0000
	add	hl,sp
	ld	e, l
	ld	d, h
	ld	hl, #0x0014
	add	hl, sp
	ld	bc, #0x0004
	ldir
	.map	src/gpl/_fsgt.c, 63, "if (((fl1.l | fl2.l) & 0x7FFFFFFF) == 0)"
	ld	hl,#0x0004
	add	hl,sp
	ld	e, l
	ld	d, h
	ld	hl, #0x0008
	add	hl, sp
	ex	de, hl
	ld	bc, #0x0004
	ldir
	ld	hl,#0x0000
	add	hl,sp
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	inc	hl
	ld	c,(hl)
	inc	hl
	ld	b,(hl)
	ld	a,(ix + -4)
	or	a, e
	ld	e,a
	ld	a,(ix + -3)
	or	a, d
	ld	d,a
	ld	a,(ix + -2)
	or	a, c
	ld	l,a
	ld	a,(ix + -1)
	or	a, b
	ld	h,a
	ld	a,e
	or	a,a
	jp	NZ,00102$
	or	a,d
	jp	NZ,00102$
	cp	a, a
	adc	hl, hl
	jp	NZ,00102$
	.map	src/gpl/_fsgt.c, 64, "return (0);"
	ld	l,#0x00
	jp	00110$
00102$:
	.map	src/gpl/_fsgt.c, 66, "if (fl1.l<0 && fl2.l<0) {"
	ld	hl,#0x0004
	add	hl,sp
	ld	d,(hl)
	inc	hl
	ld	e,(hl)
	inc	hl
	ld	c,(hl)
	inc	hl
	ld	h,(hl)
	bit	7, h
	jp	Z,00106$
	ld	hl,#0x0000
	add	hl,sp
	ld	d,(hl)
	inc	hl
	ld	e,(hl)
	inc	hl
	ld	c,(hl)
	inc	hl
	ld	h,(hl)
	bit	7, h
	jp	Z,00106$
	.map	src/gpl/_fsgt.c, 67, "if (fl2.l > fl1.l)"
	ld	hl,#0x0000
	add	hl,sp
	ld	e, l
	ld	d, h
	ld	hl, #0x0008
	add	hl, sp
	ex	de, hl
	ld	bc, #0x0004
	ldir
	ld	hl,#0x0004
	add	hl,sp
	ld	d,(hl)
	inc	hl
	ld	e,(hl)
	inc	hl
	ld	c,(hl)
	inc	hl
	ld	h,(hl)
	ld	a,d
	sub	a, (ix + -4)
	ld	a,e
	sbc	a, (ix + -3)
	ld	a,c
	sbc	a, (ix + -2)
	ld	a,h
	sbc	a, (ix + -1)
	jp	PO, 00134$
	xor	a, #0x80
00134$:
	jp	P,00104$
	.map	src/gpl/_fsgt.c, 68, "return (1);"
	ld	l,#0x01
	jp	00110$
00104$:
	.map	src/gpl/_fsgt.c, 69, "return (0);"
	ld	l,#0x00
	jp	00110$
00106$:
	.map	src/gpl/_fsgt.c, 72, "if (fl1.l > fl2.l)"
	ld	hl,#0x0004
	add	hl,sp
	ld	e, l
	ld	d, h
	ld	hl, #0x0008
	add	hl, sp
	ex	de, hl
	ld	bc, #0x0004
	ldir
	ld	hl,#0x0000
	add	hl,sp
	ld	d,(hl)
	inc	hl
	ld	e,(hl)
	inc	hl
	ld	c,(hl)
	inc	hl
	ld	h,(hl)
	ld	a,d
	sub	a, (ix + -4)
	ld	a,e
	sbc	a, (ix + -3)
	ld	a,c
	sbc	a, (ix + -2)
	ld	a,h
	sbc	a, (ix + -1)
	jp	PO, 00135$
	xor	a, #0x80
00135$:
	jp	P,00109$
	.map	src/gpl/_fsgt.c, 73, "return (1);"
	ld	l,#0x01
	jp	00110$
00109$:
	.map	src/gpl/_fsgt.c, 74, "return (0);"
	ld	l,#0x00
00110$:
	ld	sp, ix
	pop	ix
	ret
	___fsgt_end::
.function	___fsgt, ___fsgt_start, ___fsgt_end
	.area _CODE
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area _CODE
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
