;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.4.1 #9072 (Jan 24 2019) (Linux)
; This file was generated Thu Jan 24 08:46:17 2019
;--------------------------------------------------------
	.module powf
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _logf
	.globl _expf
	.globl _powf
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
	.map	src/gpl/powf.c, 35, "float powf(float x, float y)"
;	---------------------------------
; Function powf
; ---------------------------------
_powf_start::
_powf:
	push	ix
	ld	ix,#0
	add	ix,sp
	.map	src/gpl/powf.c, 37, "if(y == 0.0) return 1.0;"
	ld	a,(ix + 11)
	res	7, a
	or	a, (ix + 10)
	or	a, (ix + 9)
	or	a,(ix + 8)
	jp	NZ,00102$
	ld	hl,#0x0000
	ld	de,#0x3F80
	jp	00107$
00102$:
	.map	src/gpl/powf.c, 38, "if(y == 1.0) return x;"
	ld	hl,#0x3F80
	push	hl
	ld	hl,#0x0000
	push	hl
	ld	l,(ix + 10)
	ld	h,(ix + 11)
	push	hl
	ld	l,(ix + 8)
	ld	h,(ix + 9)
	push	hl
	call	___fseq
	pop	af
	pop	af
	pop	af
	pop	af
	ld	a,l
	or	a, a
	jp	Z,00104$
	ld	l,(ix + 4)
	ld	h,(ix + 5)
	ld	e,(ix + 6)
	ld	d,(ix + 7)
	jp	00107$
00104$:
	.map	src/gpl/powf.c, 39, "if(x <= 0.0) return 0.0;"
	ld	hl,#0x0000
	push	hl
	ld	hl,#0x0000
	push	hl
	ld	l,(ix + 6)
	ld	h,(ix + 7)
	push	hl
	ld	l,(ix + 4)
	ld	h,(ix + 5)
	push	hl
	call	___fsgt
	pop	af
	pop	af
	pop	af
	pop	af
	ld	a,l
	or	a, a
	jp	NZ,00106$
	ld	hl,#0x0000
	ld	e,l
	ld	d,h
	jp	00107$
00106$:
	.map	src/gpl/powf.c, 40, "return expf(logf(x) * y);"
	ld	l,(ix + 6)
	ld	h,(ix + 7)
	push	hl
	ld	l,(ix + 4)
	ld	h,(ix + 5)
	push	hl
	call	_logf
	pop	af
	pop	af
	ld	c,l
	ld	b,h
	ld	l,(ix + 10)
	ld	h,(ix + 11)
	push	hl
	ld	l,(ix + 8)
	ld	h,(ix + 9)
	push	hl
	push	de
	push	bc
	call	___fsmul
	pop	af
	pop	af
	pop	af
	pop	af
	push	de
	push	hl
	call	_expf
	pop	af
	pop	af
00107$:
	pop	ix
	ret
	_powf_end::
.function	_powf, _powf_start, _powf_end
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
