;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.4.1 #9072 (Jan 24 2019) (Linux)
; This file was generated Thu Jan 24 08:46:16 2019
;--------------------------------------------------------
	.module _modulong
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl __modulong
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
	.map	src/gpl/_modulong.c, 32, "unsigned long _modulong (unsigned long a, unsigned long b)"
;	---------------------------------
; Function _modulong
; ---------------------------------
__modulong_start::
__modulong:
	push	ix
	ld	ix,#0
	add	ix,sp
	.map	src/gpl/_modulong.c, 34, "unsigned char count = 0;"
	ld	d,#0x00
	.map	src/gpl/_modulong.c, 36, "while (!MSB_SET(b))"
	ld	e,#0x00
00103$:
	ld	a,(ix + 11)
	rlc	a
	and	a,#0x01
	jp	NZ,00117$
	.map	src/gpl/_modulong.c, 38, "b <<= 1;"
	push	af
	pop	af
	ld	b,#0x01
	sla	(ix + 8)
	rl	(ix + 9)
	rl	(ix + 10)
	rl	(ix + 11)
	.map	src/gpl/_modulong.c, 39, "if (b > a)"
	ld	a,(ix + 4)
	sub	a, (ix + 8)
	ld	a,(ix + 5)
	sbc	a, (ix + 9)
	ld	a,(ix + 6)
	sbc	a, (ix + 10)
	ld	a,(ix + 7)
	sbc	a, (ix + 11)
	jp	NC,00102$
	.map	src/gpl/_modulong.c, 41, "b >>=1;"
	push	af
	pop	af
	ld	b,#0x01
	srl	(ix + 11)
	rr	(ix + 10)
	rr	(ix + 9)
	rr	(ix + 8)
	.map	src/gpl/_modulong.c, 42, "break;"
	jp	00117$
00102$:
	.map	src/gpl/_modulong.c, 44, "count++;"
	inc	e
	ld	d,e
	jp	00103$
	.map	src/gpl/_modulong.c, 46, "do"
00117$:
00108$:
	.map	src/gpl/_modulong.c, 48, "if (a >= b)"
	ld	a,(ix + 4)
	sub	a, (ix + 8)
	ld	a,(ix + 5)
	sbc	a, (ix + 9)
	ld	a,(ix + 6)
	sbc	a, (ix + 10)
	ld	a,(ix + 7)
	sbc	a, (ix + 11)
	jp	C,00107$
	.map	src/gpl/_modulong.c, 49, "a -= b;"
	ld	a,(ix + 4)
	sub	a, (ix + 8)
	ld	(ix + 4),a
	ld	a,(ix + 5)
	sbc	a, (ix + 9)
	ld	(ix + 5),a
	ld	a,(ix + 6)
	sbc	a, (ix + 10)
	ld	(ix + 6),a
	ld	a,(ix + 7)
	sbc	a, (ix + 11)
	ld	(ix + 7),a
00107$:
	.map	src/gpl/_modulong.c, 50, "b >>= 1;"
	push	af
	pop	af
	ld	b,#0x01
	srl	(ix + 11)
	rr	(ix + 10)
	rr	(ix + 9)
	rr	(ix + 8)
	.map	src/gpl/_modulong.c, 52, "while (count--);"
	ld	h,d
	dec	d
	ld	a,h
	or	a, a
	jp	NZ,00108$
	.map	src/gpl/_modulong.c, 54, "return a;"
	ld	l,(ix + 4)
	ld	h,(ix + 5)
	ld	e,(ix + 6)
	ld	d,(ix + 7)
	pop	ix
	ret
	__modulong_end::
.function	__modulong, __modulong_start, __modulong_end
	.area _CODE
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area _CODE
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
