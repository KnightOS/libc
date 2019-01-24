;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.4.1 #9072 (Jan 24 2019) (Linux)
; This file was generated Thu Jan 24 08:46:17 2019
;--------------------------------------------------------
	.module _mullong
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl __mullong
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
	.map	src/gpl/_mullong.c, 76, "_mullong (long a, long b)"
;	---------------------------------
; Function _mullong
; ---------------------------------
__mullong_start::
__mullong:
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	hl,#-6
	add	hl,sp
	ld	sp,hl
	.map	src/gpl/_mullong.c, 80, "bcast(a)->i.hi *= bcast(b)->i.lo;"
	ld	hl,#0x000A
	add	hl,sp
	ld	c,l
	ld	b,h
	inc	hl
	inc	hl
	ld	(ix + -4),l
	ld	(ix + -3),h
	ld	l, c
	ld	h, b
	inc	hl
	inc	hl
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	hl,#0x000E
	add	hl,sp
	ld	(ix + -2),l
	ld	(ix + -1),h
	ld	l,(ix + -2)
	ld	h,(ix + -1)
	ld	a, (hl)
	inc	hl
	ld	h,(hl)
	ld	l,a
	push	bc
	push	hl
	push	de
	call	__mulint
	pop	af
	pop	af
	ld	d,l
	ld	e,h
	pop	bc
	ld	l,(ix + -4)
	ld	h,(ix + -3)
	ld	(hl),d
	inc	hl
	ld	(hl),e
	.map	src/gpl/_mullong.c, 81, "bcast(a)->i.hi += bcast(b)->i.hi * bcast(a)->i.lo;"
	ld	l, c
	ld	h, b
	inc	hl
	inc	hl
	ld	(ix + -4),l
	ld	(ix + -3),h
	ld	l, c
	ld	h, b
	inc	hl
	inc	hl
	ld	a,(hl)
	ld	(ix + -6),a
	inc	hl
	ld	a,(hl)
	ld	(ix + -5),a
	ld	l,(ix + -2)
	ld	h,(ix + -1)
	inc	hl
	inc	hl
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	l, c
	ld	h, b
	ld	a, (hl)
	inc	hl
	ld	h,(hl)
	ld	l,a
	push	bc
	push	hl
	push	de
	call	__mulint
	pop	af
	pop	af
	pop	bc
	ld	a,(ix + -6)
	add	a, l
	ld	d,a
	ld	a,(ix + -5)
	adc	a, h
	ld	e,a
	ld	l,(ix + -4)
	ld	h,(ix + -3)
	ld	(hl),d
	inc	hl
	ld	(hl),e
	.map	src/gpl/_mullong.c, 84, "bcast(a)->i.hi += bcast(a)->b.b1 * bcast(b)->b.b1;"
	ld	l, c
	ld	h, b
	inc	hl
	inc	hl
	ex	(sp), hl
	ld	l, c
	ld	h, b
	inc	hl
	inc	hl
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	l, c
	ld	h, b
	inc	hl
	ld	a,(hl)
	ld	(ix + -4),a
	ld	l,(ix + -2)
	ld	h,(ix + -1)
	inc	hl
	ld	h,(hl)
	push	de
	push	bc
	ld	e,(ix + -4)
	ld	l, #0x00
	ld	d, l
	ld	b, #0x08
00103$:
	add	hl,hl
	jp	NC,00104$
	add	hl,de
00104$:
	djnz	00103$
	pop	bc
	pop	de
	add	hl,de
	ex	de,hl
	pop	hl
	push	hl
	ld	(hl),e
	inc	hl
	ld	(hl),d
	.map	src/gpl/_mullong.c, 86, "i12 = bcast(b)->b.b0 * bcast(a)->b.b1;"
	ld	l,(ix + -2)
	ld	h,(ix + -1)
	ld	e,(hl)
	ld	l, c
	ld	h, b
	inc	hl
	ld	h,(hl)
	push	bc
	ld	l, #0x00
	ld	d, l
	ld	b, #0x08
00105$:
	add	hl,hl
	jp	NC,00106$
	add	hl,de
00106$:
	djnz	00105$
	pop	bc
	ld	e, l
	ld	d, h
	.map	src/gpl/_mullong.c, 87, "bcast(b)->bi.i12 = bcast(a)->b.b0 * bcast(b)->b.b1;"
	ld	l,(ix + -2)
	ld	h,(ix + -1)
	inc	hl
	push	hl
	pop	iy
	ld	l, c
	ld	h, b
	ld	a,(hl)
	ld	(ix + -6),a
	ld	l,(ix + -2)
	ld	h,(ix + -1)
	inc	hl
	ld	a,(hl)
	push	de
	push	bc
	ld	e,a
	ld	h,(ix + -6)
	ld	l, #0x00
	ld	d, l
	ld	b, #0x08
00107$:
	add	hl,hl
	jp	NC,00108$
	add	hl,de
00108$:
	djnz	00107$
	pop	bc
	pop	de
	ld	(iy + 0),l
	ld	(iy + 1),h
	.map	src/gpl/_mullong.c, 90, "bcast(b)->b.b3 = ((bcast(b)->bi.i12 += i12) < i12);"
	ld	l,(ix + -2)
	ld	h,(ix + -1)
	inc	hl
	inc	hl
	inc	hl
	ex	(sp), hl
	ld	l,(ix + -2)
	ld	h,(ix + -1)
	inc	hl
	push	hl
	pop	iy
	ld	l,(ix + -2)
	ld	h,(ix + -1)
	inc	hl
	ld	a, (hl)
	inc	hl
	ld	h,(hl)
	ld	l,a
	add	hl,de
	ld	(iy + 0),l
	ld	(iy + 1),h
	cp	a, a
	sbc	hl, de
	ld	a,#0x00
	rla
	pop	hl
	push	hl
	ld	(hl),a
	.map	src/gpl/_mullong.c, 92, "bcast(a)->i.lo  = bcast(a)->b.b0 * bcast(b)->b.b0;"
	ld	e, c
	ld	d, b
	ld	a,(bc)
	ld	c,a
	ld	l,(ix + -2)
	ld	h,(ix + -1)
	ld	h,(hl)
	push	de
	ld	e,c
	ld	l, #0x00
	ld	d, l
	ld	b, #0x08
00109$:
	add	hl,hl
	jp	NC,00110$
	add	hl,de
00110$:
	djnz	00109$
	pop	de
	ld	c,l
	ld	b,h
	ld	a,c
	ld	(de),a
	inc	de
	ld	a,b
	ld	(de),a
	.map	src/gpl/_mullong.c, 94, "bcast(b)->bi.b0 = 0;"
	ld	l,(ix + -2)
	ld	h,(ix + -1)
	ld	(hl),#0x00
	.map	src/gpl/_mullong.c, 96, "return a + b;"
	ld	a,(ix + 4)
	add	a, (ix + 8)
	ld	l,a
	ld	a,(ix + 5)
	adc	a, (ix + 9)
	ld	h,a
	ld	a,(ix + 6)
	adc	a, (ix + 10)
	ld	e,a
	ld	a,(ix + 7)
	adc	a, (ix + 11)
	ld	d,a
	ld	sp, ix
	pop	ix
	ret
	__mullong_end::
.function	__mullong, __mullong_start, __mullong_end
	.area _CODE
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area _CODE
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
