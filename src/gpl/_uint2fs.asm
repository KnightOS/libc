;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.4.1 #9072 (Jan 24 2019) (Linux)
; This file was generated Thu Jan 24 08:46:17 2019
;--------------------------------------------------------
	.module _uint2fs
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl ___ulong2fs
	.globl ___uint2fs
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
	.map	src/gpl/_uint2fs.c, 32, "float __uint2fs (unsigned int ui) {"
;	---------------------------------
; Function __uint2fs
; ---------------------------------
___uint2fs_start::
___uint2fs:
	.map	src/gpl/_uint2fs.c, 33, "return __ulong2fs(ui);"
	ld	iy,#2
	add	iy,sp
	ld	l,(iy + 0)
	ld	h,(iy + 1)
	ld	de,#0x0000
	push	de
	push	hl
	call	___ulong2fs
	pop	af
	pop	af
	ret
	___uint2fs_end::
.function	___uint2fs, ___uint2fs_start, ___uint2fs_end
	.area _CODE
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area _CODE
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
