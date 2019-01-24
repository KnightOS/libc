;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.4.1 #9072 (Jan 24 2019) (Linux)
; This file was generated Thu Jan 24 08:46:16 2019
;--------------------------------------------------------
	.module _divulong
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl __divulong
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
	.map	src/gpl/_divulong.c, 34, "_divulong (unsigned long x, unsigned long y)"
;	---------------------------------
; Function _divulong
; ---------------------------------
__divulong_start::
__divulong:
	push	ix
	ld	ix,#0
	add	ix,sp
	push	af
	push	af
	.map	src/gpl/_divulong.c, 36, "unsigned long reste = 0L;"
	xor	a, a
	ld	(ix + -4),a
	ld	(ix + -3),a
	ld	(ix + -2),a
	ld	(ix + -1),a
	.map	src/gpl/_divulong.c, 40, "do"
	ld	d,#0x20
00105$:
	.map	src/gpl/_divulong.c, 43, "c = MSB_SET(x);"
	ld	a,(ix + 7)
	rlc	a
	and	a,#0x01
	ld	h,a
	.map	src/gpl/_divulong.c, 44, "x <<= 1;"
	push	af
	pop	af
	ld	b,#0x01
	sla	(ix + 4)
	rl	(ix + 5)
	rl	(ix + 6)
	rl	(ix + 7)
	.map	src/gpl/_divulong.c, 45, "reste <<= 1;"
	push	af
	pop	af
	ld	b,#0x01
	sla	(ix + -4)
	rl	(ix + -3)
	rl	(ix + -2)
	rl	(ix + -1)
	.map	src/gpl/_divulong.c, 46, "if (c)"
	bit	0,h
	jp	Z,00102$
	.map	src/gpl/_divulong.c, 47, "reste |= 1L;"
	ld	a,(ix + -4)
	set	0, a
	ld	(ix + -4),a
00102$:
	.map	src/gpl/_divulong.c, 49, "if (reste >= y)"
	ld	a,(ix + -4)
	sub	a, (ix + 8)
	ld	a,(ix + -3)
	sbc	a, (ix + 9)
	ld	a,(ix + -2)
	sbc	a, (ix + 10)
	ld	a,(ix + -1)
	sbc	a, (ix + 11)
	jp	C,00106$
	.map	src/gpl/_divulong.c, 51, "reste -= y;"
	ld	a,(ix + -4)
	sub	a, (ix + 8)
	ld	(ix + -4),a
	ld	a,(ix + -3)
	sbc	a, (ix + 9)
	ld	(ix + -3),a
	ld	a,(ix + -2)
	sbc	a, (ix + 10)
	ld	(ix + -2),a
	ld	a,(ix + -1)
	sbc	a, (ix + 11)
	ld	(ix + -1),a
	.map	src/gpl/_divulong.c, 53, "x |= 1L;"
	ld	a,(ix + 4)
	set	0, a
	ld	(ix + 4),a
00106$:
	.map	src/gpl/_divulong.c, 56, "while (--count);"
	dec	d
	ld	a,d
	or	a, a
	jp	NZ,00105$
	.map	src/gpl/_divulong.c, 57, "return x;"
	ld	l,(ix + 4)
	ld	h,(ix + 5)
	ld	e,(ix + 6)
	ld	d,(ix + 7)
	ld	sp, ix
	pop	ix
	ret
	__divulong_end::
.function	__divulong, __divulong_start, __divulong_end
	.area _CODE
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area _CODE
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
