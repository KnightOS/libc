;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.4.1 #9072 (Jan 24 2019) (Linux)
; This file was generated Thu Jan 24 08:46:16 2019
;--------------------------------------------------------
	.module schar2fs
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl ___slong2fs
	.globl ___schar2fs
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
	.map	src/gpl/schar2fs.c, 33, "__schar2fs (signed char sc)"
;	---------------------------------
; Function __schar2fs
; ---------------------------------
___schar2fs_start::
___schar2fs:
	.map	src/gpl/schar2fs.c, 35, "return __slong2fs (sc);"
	ld	iy,#2
	add	iy,sp
	ld	l,(iy + 0)
	ld	a,(iy + 0)
	rla
	sbc	a, a
	ld	h,a
	ld	e,a
	ld	d,a
	push	de
	push	hl
	call	___slong2fs
	pop	af
	pop	af
	ret
	___schar2fs_end::
.function	___schar2fs, ___schar2fs_start, ___schar2fs_end
	.area _CODE
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area _CODE
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
