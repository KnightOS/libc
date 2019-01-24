;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.4.1 #9072 (Jan 24 2019) (Linux)
; This file was generated Thu Jan 24 08:46:17 2019
;--------------------------------------------------------
	.module ldexpf
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _ldexpf
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
	.area _CODE
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area _CODE
	.map	src/gpl/ldexpf.c, 34, "float ldexpf(float x, int pw2)"
;	---------------------------------
; Function ldexpf
; ---------------------------------
_ldexpf_start::
_ldexpf:
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	hl,#-12
	add	hl,sp
	ld	sp,hl
	.map	src/gpl/ldexpf.c, 39, "fl.f = x;"
	ld	hl,#0x0000
	add	hl,sp
	ld	e, l
	ld	d, h
	ld	hl, #0x0010
	add	hl, sp
	ld	bc, #0x0004
	ldir
	.map	src/gpl/ldexpf.c, 41, "e=(fl.l >> 23) & 0x000000ff;"
	ld	hl,#0x0000
	add	hl,sp
	ld	e,l
	ld	d,h
	ld	c,(hl)
	inc	hl
	ld	b,(hl)
	inc	hl
	inc	hl
	ld	a,(hl)
	dec	hl
	ld	l,(hl)
	ld	h,a
	ld	a,#0x17
00103$:
	sra	h
	rr	l
	rr	b
	rr	c
	dec	a
	jr	NZ,00103$
	ld	(ix + -8),c
	ld	(ix + -7),#0x00
	ld	(ix + -6),#0x00
	ld	(ix + -5),#0x00
	.map	src/gpl/ldexpf.c, 42, "e+=pw2;"
	ld	l,(ix + 8)
	ld	h,(ix + 9)
	ld	a,(ix + 9)
	rla
	sbc	a, a
	ld	c,a
	ld	b,a
	ld	a,(ix + -8)
	add	a, l
	ld	l,a
	ld	a,(ix + -7)
	adc	a, h
	ld	h,a
	ld	a,(ix + -6)
	adc	a, c
	ld	c,a
	ld	a,(ix + -5)
	adc	a, b
	ld	b,a
	.map	src/gpl/ldexpf.c, 43, "fl.l= ((e & 0xff) << 23) | (fl.l & 0x807fffff);"
	ld	h,#0x00
	ld	bc,#0x0000
	push	af
	ld	(ix + -8),l
	ld	(ix + -7),h
	ld	(ix + -6),c
	ld	(ix + -5),b
	pop	af
	ld	a,#0x17
00105$:
	sla	(ix + -8)
	rl	(ix + -7)
	rl	(ix + -6)
	rl	(ix + -5)
	dec	a
	jr	NZ,00105$
	ld	l, e
	ld	h, d
	ld	c,(hl)
	inc	hl
	ld	b,(hl)
	inc	hl
	inc	hl
	ld	a,(hl)
	dec	hl
	ld	l,(hl)
	ld	h,a
	ld	(ix + -4),c
	ld	(ix + -3),b
	ld	a,l
	and	a, #0x7F
	ld	(ix + -2),a
	ld	a,h
	and	a, #0x80
	ld	(ix + -1),a
	ld	l,(ix + -8)
	ld	h,(ix + -7)
	ld	b,(ix + -6)
	ld	c,(ix + -5)
	ld	a,(ix + -4)
	or	a, l
	ld	(ix + -4),a
	ld	a,(ix + -3)
	or	a, h
	ld	(ix + -3),a
	ld	a,(ix + -2)
	or	a, b
	ld	(ix + -2),a
	ld	a,(ix + -1)
	or	a, c
	ld	(ix + -1),a
	ld	hl, #0x0008
	add	hl, sp
	ld	bc, #0x0004
	ldir
	.map	src/gpl/ldexpf.c, 45, "return(fl.f);"
	ld	hl,#0x0000
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
	ld	sp, ix
	pop	ix
	ret
	_ldexpf_end::
.function	_ldexpf, _ldexpf_start, _ldexpf_end
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
