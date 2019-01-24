;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.4.1 #9072 (Jan 24 2019) (Linux)
; This file was generated Thu Jan 24 08:46:17 2019
;--------------------------------------------------------
	.module _fssub
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl ___fssub
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
	.map	src/gpl/_fssub.c, 50, "float __fssub (float a1, float a2)"
;	---------------------------------
; Function __fssub
; ---------------------------------
___fssub_start::
___fssub:
	push	ix
	ld	ix,#0
	add	ix,sp
	.map	src/gpl/_fssub.c, 52, "float neg = -a1;"
	ld	a,(ix + 7)
	xor	a,#0x80
	ld	b,a
	ld	e,(ix + 4)
	ld	d,(ix + 5)
	ld	c,(ix + 6)
	.map	src/gpl/_fssub.c, 53, "return -(neg + a2);"
	ld	l,(ix + 10)
	ld	h,(ix + 11)
	push	hl
	ld	l,(ix + 8)
	ld	h,(ix + 9)
	push	hl
	push	bc
	push	de
	call	___fsadd
	pop	af
	pop	af
	pop	af
	pop	af
	ld	a,d
	xor	a,#0x80
	ld	d,a
	pop	ix
	ret
	___fssub_end::
.function	___fssub, ___fssub_start, ___fssub_end
	.area _CODE
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area _CODE
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
