;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.4.1 #9072 (Jan 24 2019) (Linux)
; This file was generated Thu Jan 24 08:46:16 2019
;--------------------------------------------------------
	.module _fs2uint
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl ___fs2ulong
	.globl ___fs2uint
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
	.map	src/gpl/_fs2uint.c, 34, "unsigned int __fs2uint (float f)"
;	---------------------------------
; Function __fs2uint
; ---------------------------------
___fs2uint_start::
___fs2uint:
	push	ix
	ld	ix,#0
	add	ix,sp
	.map	src/gpl/_fs2uint.c, 36, "unsigned long ul=__fs2ulong(f);"
	ld	l,(ix + 6)
	ld	h,(ix + 7)
	push	hl
	ld	l,(ix + 4)
	ld	h,(ix + 5)
	push	hl
	call	___fs2ulong
	pop	af
	pop	af
	.map	src/gpl/_fs2uint.c, 37, "if (ul>=UINT_MAX) return UINT_MAX;"
	ld	a,l
	sub	a, #0xFF
	ld	a,h
	sbc	a, #0xFF
	ld	a,e
	sbc	a, #0x00
	ld	a,d
	sbc	a, #0x00
	jp	C,00102$
	ld	hl,#0xFFFF
	jp	00103$
00102$:
	.map	src/gpl/_fs2uint.c, 38, "return ul;"
00103$:
	pop	ix
	ret
	___fs2uint_end::
.function	___fs2uint, ___fs2uint_start, ___fs2uint_end
	.area _CODE
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area _CODE
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
