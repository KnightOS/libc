;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.4.1 #9072 (Jan 24 2019) (Linux)
; This file was generated Thu Jan 24 08:46:14 2019
;--------------------------------------------------------
	.module _fs2slong
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl ___fs2ulong
	.globl ___fs2slong
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
	.map	src/gpl/_fs2slong.c, 32, "signed long __fs2slong (float f)"
;	---------------------------------
; Function __fs2slong
; ---------------------------------
___fs2slong_start::
___fs2slong:
	push	ix
	ld	ix,#0
	add	ix,sp
	.map	src/gpl/_fs2slong.c, 35, "if (!f)"
	ld	a,(ix + 7)
	res	7, a
	or	a, (ix + 6)
	or	a, (ix + 5)
	or	a,(ix + 4)
	jp	NZ,00102$
	.map	src/gpl/_fs2slong.c, 36, "return 0;"
	ld	hl,#0x0000
	ld	e,l
	ld	d,h
	jp	00106$
00102$:
	.map	src/gpl/_fs2slong.c, 38, "if (f<0) {"
	ld	hl,#0x0000
	push	hl
	ld	hl,#0x0000
	push	hl
	ld	l,(ix + 6)
	ld	h,(ix + 7)
	push	hl
	ld	l,(ix + 4)
	ld	h,(ix + 5)
	push	hl
	call	___fslt
	pop	af
	pop	af
	pop	af
	pop	af
	ld	a,l
	or	a, a
	jp	Z,00104$
	.map	src/gpl/_fs2slong.c, 39, "return -__fs2ulong(-f);"
	ld	a,(ix + 7)
	xor	a,#0x80
	ld	d,a
	ld	l,(ix + 4)
	ld	h,(ix + 5)
	ld	e,(ix + 6)
	push	de
	push	hl
	call	___fs2ulong
	pop	af
	pop	af
	xor	a, a
	sub	a, l
	ld	l,a
	ld	a, #0x00
	sbc	a, h
	ld	h,a
	ld	a, #0x00
	sbc	a, e
	ld	e,a
	ld	a, #0x00
	sbc	a, d
	ld	d,a
	jp	00106$
00104$:
	.map	src/gpl/_fs2slong.c, 41, "return __fs2ulong(f);"
	ld	l,(ix + 6)
	ld	h,(ix + 7)
	push	hl
	ld	l,(ix + 4)
	ld	h,(ix + 5)
	push	hl
	call	___fs2ulong
	pop	af
	pop	af
00106$:
	pop	ix
	ret
	___fs2slong_end::
.function	___fs2slong, ___fs2slong_start, ___fs2slong_end
	.area _CODE
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area _CODE
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
