;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.4.1 #9072 (Jan 24 2019) (Linux)
; This file was generated Thu Jan 24 08:46:14 2019
;--------------------------------------------------------
	.module _fs2schar
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl ___fs2slong
	.globl ___fs2schar
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
	.map	src/gpl/_fs2schar.c, 32, "signed char __fs2schar (float f)"
;	---------------------------------
; Function __fs2schar
; ---------------------------------
___fs2schar_start::
___fs2schar:
	.map	src/gpl/_fs2schar.c, 34, "signed long sl=__fs2slong(f);"
	ld	iy,#2
	add	iy,sp
	ld	l,(iy + 2)
	ld	h,(iy + 3)
	push	hl
	ld	l,(iy + 0)
	ld	h,(iy + 1)
	push	hl
	call	___fs2slong
	pop	af
	pop	af
	.map	src/gpl/_fs2schar.c, 35, "if (sl>=SCHAR_MAX)"
	ld	a,l
	sub	a, #0x7F
	ld	a,h
	sbc	a, #0x00
	ld	a,e
	sbc	a, #0x00
	ld	a,d
	rla
	ccf
	rra
	sbc	a, #0x80
	jp	C,00102$
	.map	src/gpl/_fs2schar.c, 36, "return SCHAR_MAX;"
	ld	l,#0x7F
	ret
00102$:
	.map	src/gpl/_fs2schar.c, 37, "if (sl<=SCHAR_MIN)"
	ld	a,#0x80
	cp	a, l
	ld	a,#0xFF
	sbc	a, h
	ld	a,#0xFF
	sbc	a, e
	ld	a,#0xFF
	sbc	a, d
	jp	PO, 00115$
	xor	a, #0x80
00115$:
	jp	M,00104$
	.map	src/gpl/_fs2schar.c, 38, "return -SCHAR_MIN;"
	ld	l,#0x80
	ret
00104$:
	.map	src/gpl/_fs2schar.c, 39, "return sl;"
	ret
	___fs2schar_end::
.function	___fs2schar, ___fs2schar_start, ___fs2schar_end
	.area _CODE
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area _CODE
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
