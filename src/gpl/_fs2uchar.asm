;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.4.1 #9072 (Jan 24 2019) (Linux)
; This file was generated Thu Jan 24 08:46:16 2019
;--------------------------------------------------------
	.module _fs2uchar
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl ___fs2ulong
	.globl ___fs2uchar
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
	.map	src/gpl/_fs2uchar.c, 32, "unsigned char __fs2uchar (float f)"
;	---------------------------------
; Function __fs2uchar
; ---------------------------------
___fs2uchar_start::
___fs2uchar:
	.map	src/gpl/_fs2uchar.c, 34, "unsigned long ul=__fs2ulong(f);"
	ld	iy,#2
	add	iy,sp
	ld	l,(iy + 2)
	ld	h,(iy + 3)
	push	hl
	ld	l,(iy + 0)
	ld	h,(iy + 1)
	push	hl
	call	___fs2ulong
	pop	af
	pop	af
	.map	src/gpl/_fs2uchar.c, 35, "if (ul>=UCHAR_MAX) return UCHAR_MAX;"
	ld	a,l
	sub	a, #0xFF
	ld	a,h
	sbc	a, #0x00
	ld	a,e
	sbc	a, #0x00
	ld	a,d
	sbc	a, #0x00
	jp	C,00102$
	ld	l,#0xFF
	ret
00102$:
	.map	src/gpl/_fs2uchar.c, 36, "return ul;"
	ret
	___fs2uchar_end::
.function	___fs2uchar, ___fs2uchar_start, ___fs2uchar_end
	.area _CODE
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area _CODE
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
