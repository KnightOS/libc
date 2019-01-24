;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.4.1 #9072 (Jan 24 2019) (Linux)
; This file was generated Thu Jan 24 08:46:17 2019
;--------------------------------------------------------
	.module slong2fs
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl ___ulong2fs
	.globl ___slong2fs
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
	.map	src/gpl/slong2fs.c, 33, "__slong2fs (signed long sl)"
;	---------------------------------
; Function __slong2fs
; ---------------------------------
___slong2fs_start::
___slong2fs:
	push	ix
	ld	ix,#0
	add	ix,sp
	.map	src/gpl/slong2fs.c, 35, "if (sl < 0) "
	bit	7, (ix + 7)
	jp	Z,00102$
	.map	src/gpl/slong2fs.c, 36, "return -__ulong2fs (-sl);"
	xor	a, a
	sub	a, (ix + 4)
	ld	l,a
	ld	a, #0x00
	sbc	a, (ix + 5)
	ld	h,a
	ld	a, #0x00
	sbc	a, (ix + 6)
	ld	e,a
	ld	a, #0x00
	sbc	a, (ix + 7)
	ld	d,a
	push	de
	push	hl
	call	___ulong2fs
	pop	af
	pop	af
	ld	a,d
	xor	a,#0x80
	ld	d,a
	jp	00104$
00102$:
	.map	src/gpl/slong2fs.c, 38, "return __ulong2fs (sl);"
	ld	l,(ix + 6)
	ld	h,(ix + 7)
	push	hl
	ld	l,(ix + 4)
	ld	h,(ix + 5)
	push	hl
	call	___ulong2fs
	pop	af
	pop	af
00104$:
	pop	ix
	ret
	___slong2fs_end::
.function	___slong2fs, ___slong2fs_start, ___slong2fs_end
	.area _CODE
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area _CODE
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
