;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.4.1 #9072 (Jan 24 2019) (Linux)
; This file was generated Thu Jan 24 08:46:15 2019
;--------------------------------------------------------
	.module _ulong2fs
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl ___ulong2fs
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
	.map	src/gpl/_ulong2fs.c, 55, "float __ulong2fs (unsigned long a )"
;	---------------------------------
; Function __ulong2fs
; ---------------------------------
___ulong2fs_start::
___ulong2fs:
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	hl,#-6
	add	hl,sp
	ld	sp,hl
	.map	src/gpl/_ulong2fs.c, 60, "if (!a)"
	ld	a,(ix + 7)
	or	a, (ix + 6)
	or	a, (ix + 5)
	or	a,(ix + 4)
	jp	NZ,00115$
	.map	src/gpl/_ulong2fs.c, 62, "return 0.0;"
	ld	hl,#0x0000
	ld	e,l
	ld	d,h
	jp	00111$
	.map	src/gpl/_ulong2fs.c, 65, "while (a & NORM) "
00115$:
	ld	bc,#0x0096
00103$:
	ld	a,(ix + 7)
	or	a, a
	jp	Z,00117$
	.map	src/gpl/_ulong2fs.c, 68, "a >>= 1;"
	push	af
	pop	af
	ld	a,#0x01
	srl	(ix + 7)
	rr	(ix + 6)
	rr	(ix + 5)
	rr	(ix + 4)
	.map	src/gpl/_ulong2fs.c, 69, "exp++;"
	inc	bc
	jp	00103$
	.map	src/gpl/_ulong2fs.c, 72, "while (a < HIDDEN)"
00117$:
00106$:
	ld	a,(ix + 6)
	sub	a, #0x80
	ld	a,(ix + 7)
	sbc	a, #0x00
	jp	NC,00120$
	.map	src/gpl/_ulong2fs.c, 74, "a <<= 1;"
	push	af
	pop	af
	ld	a,#0x01
	sla	(ix + 4)
	rl	(ix + 5)
	rl	(ix + 6)
	rl	(ix + 7)
	.map	src/gpl/_ulong2fs.c, 75, "exp--;"
	dec	bc
	jp	00106$
00120$:
	ld	(ix + -2),c
	ld	(ix + -1),b
	.map	src/gpl/_ulong2fs.c, 78, "if ((a&0x7fffff)==0x7fffff) {"
	ld	h,(ix + 4)
	ld	l,(ix + 5)
	ld	d,(ix + 6)
	res	7, d
	ld	e,#0x00
	inc	h
	jp	NZ,00110$
	inc	l
	jp	NZ,00110$
	ld	a,d
	sub	a,#0x7F
	jp	NZ,00110$
	or	a,e
	jp	NZ,00110$
	.map	src/gpl/_ulong2fs.c, 79, "a=0;"
	xor	a, a
	ld	(ix + 4),a
	ld	(ix + 5),a
	ld	(ix + 6),a
	ld	(ix + 7),a
	.map	src/gpl/_ulong2fs.c, 80, "exp++;"
	inc	bc
	ld	(ix + -2),c
	ld	(ix + -1),b
00110$:
	.map	src/gpl/_ulong2fs.c, 83, "a &= ~HIDDEN ;"
	ld	a,(ix + 6)
	res	7, a
	ld	(ix + 6),a
	.map	src/gpl/_ulong2fs.c, 85, "fl.l = PACK(0,(unsigned long)exp, a);"
	ld	hl,#0x0000
	add	hl,sp
	ld	e,(ix + -2)
	ld	d,(ix + -1)
	ld	a,(ix + -1)
	rla
	sbc	a, a
	ld	c,a
	ld	b,a
	ld	a,#0x17
00146$:
	sla	e
	rl	d
	rl	c
	rl	b
	dec	a
	jr	NZ,00146$
	ld	a,e
	or	a, (ix + 4)
	ld	e,a
	ld	a,d
	or	a, (ix + 5)
	ld	d,a
	ld	a,c
	or	a, (ix + 6)
	ld	c,a
	ld	a,b
	or	a, (ix + 7)
	ld	b,a
	ld	(hl),e
	inc	hl
	ld	(hl),d
	inc	hl
	ld	(hl),c
	inc	hl
	ld	(hl),b
	.map	src/gpl/_ulong2fs.c, 87, "return (fl.f);"
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
00111$:
	ld	sp, ix
	pop	ix
	ret
	___ulong2fs_end::
.function	___ulong2fs, ___ulong2fs_start, ___ulong2fs_end
	.area _CODE
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area _CODE
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
