;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.4.1 #9072 (Jan 24 2019) (Linux)
; This file was generated Thu Jan 24 08:46:14 2019
;--------------------------------------------------------
	.module _fs2sint
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl ___fs2slong
	.globl ___fs2sint
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
	.map	src/gpl/_fs2sint.c, 32, "signed int __fs2sint (float f)"
;	---------------------------------
; Function __fs2sint
; ---------------------------------
___fs2sint_start::
___fs2sint:
	push	ix
	ld	ix,#0
	add	ix,sp
	.map	src/gpl/_fs2sint.c, 34, "signed long sl=__fs2slong(f);"
	ld	l,(ix + 6)
	ld	h,(ix + 7)
	push	hl
	ld	l,(ix + 4)
	ld	h,(ix + 5)
	push	hl
	call	___fs2slong
	pop	af
	pop	af
	.map	src/gpl/_fs2sint.c, 35, "if (sl>=INT_MAX)"
	ld	a,l
	sub	a, #0xFF
	ld	a,h
	sbc	a, #0x7F
	ld	a,e
	sbc	a, #0x00
	ld	a,d
	rla
	ccf
	rra
	sbc	a, #0x80
	jp	C,00102$
	.map	src/gpl/_fs2sint.c, 36, "return INT_MAX;"
	ld	hl,#0x7FFF
	jp	00105$
00102$:
	.map	src/gpl/_fs2sint.c, 37, "if (sl<=INT_MIN)"
	xor	a, a
	cp	a, l
	ld	a,#0x80
	sbc	a, h
	ld	a,#0xFF
	sbc	a, e
	ld	a,#0xFF
	sbc	a, d
	jp	PO, 00115$
	xor	a, #0x80
00115$:
	jp	M,00104$
	.map	src/gpl/_fs2sint.c, 38, "return -INT_MIN;"
	ld	hl,#0x8000
	jp	00105$
00104$:
	.map	src/gpl/_fs2sint.c, 39, "return sl;"
00105$:
	pop	ix
	ret
	___fs2sint_end::
.function	___fs2sint, ___fs2sint_start, ___fs2sint_end
	.area _CODE
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area _CODE
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
