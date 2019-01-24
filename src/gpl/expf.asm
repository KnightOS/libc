;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.4.1 #9072 (Jan 24 2019) (Linux)
; This file was generated Thu Jan 24 08:46:16 2019
;--------------------------------------------------------
	.module expf
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _ldexpf
	.globl _expf
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
	.map	src/gpl/expf.c, 53, "float expf(float x)"
;	---------------------------------
; Function expf
; ---------------------------------
_expf_start::
_expf:
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	hl,#-22
	add	hl,sp
	ld	sp,hl
	.map	src/gpl/expf.c, 59, "if(x>=0.0)"
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
	call	___fslt
	pop	af
	pop	af
	pop	af
	pop	af
	ld	a,l
	or	a, a
	jp	NZ,00102$
	.map	src/gpl/expf.c, 60, "{ y=x;  sign=0; }"
	ld	hl, #1
	add	hl, sp
	ex	de, hl
	ld	hl, #26
	add	hl, sp
	ld	bc, #4
	ldir
	ld	(ix + -22),#0x00
	jp	00103$
00102$:
	.map	src/gpl/expf.c, 62, "{ y=-x; sign=1; }"
	ld	a,(ix + 7)
	xor	a,#0x80
	ld	d,a
	ld	h,(ix + 4)
	ld	l,(ix + 5)
	ld	e,(ix + 6)
	ld	(ix + -21),h
	ld	(ix + -20),l
	ld	(ix + -19),e
	ld	(ix + -18),d
	ld	(ix + -22),#0x01
00103$:
	.map	src/gpl/expf.c, 64, "if(y<EXPEPS) return 1.0;"
	ld	hl,#0x33D6
	push	hl
	ld	hl,#0xBF95
	push	hl
	ld	l,(ix + -19)
	ld	h,(ix + -18)
	push	hl
	ld	l,(ix + -21)
	ld	h,(ix + -20)
	push	hl
	call	___fslt
	pop	af
	pop	af
	pop	af
	pop	af
	ld	(ix + -7), l
	ld	a, l
	or	a, a
	jp	Z,00105$
	ld	hl,#0x0000
	ld	de,#0x3F80
	jp	00118$
00105$:
	.map	src/gpl/expf.c, 66, "if(y>BIGX)"
	ld	hl,#0x42B1
	push	hl
	ld	hl,#0x7218
	push	hl
	ld	l,(ix + -19)
	ld	h,(ix + -18)
	push	hl
	ld	l,(ix + -21)
	ld	h,(ix + -20)
	push	hl
	call	___fsgt
	pop	af
	pop	af
	pop	af
	pop	af
	ld	a,l
	or	a, a
	jp	Z,00110$
	.map	src/gpl/expf.c, 68, "if(sign)"
	bit	0,(ix + -22)
	jp	Z,00107$
	.map	src/gpl/expf.c, 70, "errno=ERANGE;"
	ld	iy,#_errno
	ld	(iy + 0),#0x22
	ld	iy,#_errno
	ld	(iy + 1),#0x00
	.map	src/gpl/expf.c, 71, "return HUGE_VALF;"
	ld	hl,#0xFFFF
	ld	de,#0x7F7F
	jp	00118$
00107$:
	.map	src/gpl/expf.c, 75, "return 0.0;"
	ld	hl,#0x0000
	ld	e,l
	ld	d,h
	jp	00118$
00110$:
	.map	src/gpl/expf.c, 79, "z=y*K1;"
	ld	l,(ix + -19)
	ld	h,(ix + -18)
	push	hl
	ld	l,(ix + -21)
	ld	h,(ix + -20)
	push	hl
	ld	hl,#0x3FB8
	push	hl
	ld	hl,#0xAA3B
	push	hl
	.map	src/gpl/expf.c, 80, "n=z;"
	call	___fsmul
	pop	af
	pop	af
	pop	af
	pop	af
	ld	c,l
	ld	b,h
	push	bc
	push	de
	push	de
	push	bc
	call	___fs2sint
	pop	af
	pop	af
	pop	de
	pop	bc
	ld	(ix + -2),l
	ld	(ix + -1),h
	.map	src/gpl/expf.c, 82, "if(n<0) --n;"
	bit	7, (ix + -1)
	jp	Z,00112$
	ld	l,(ix + -2)
	ld	h,(ix + -1)
	dec	hl
	ld	(ix + -2),l
	ld	(ix + -1),h
00112$:
	.map	src/gpl/expf.c, 83, "if(z-n>=0.5) ++n;"
	push	bc
	push	de
	ld	l,(ix + -2)
	ld	h,(ix + -1)
	push	hl
	call	___sint2fs
	pop	af
	ld	(ix + -3),d
	ld	(ix + -4),e
	ld	(ix + -5),h
	ld	(ix + -6),l
	pop	de
	pop	bc
	ld	l,(ix + -4)
	ld	h,(ix + -3)
	push	hl
	ld	l,(ix + -6)
	ld	h,(ix + -5)
	push	hl
	push	de
	push	bc
	call	___fssub
	pop	af
	pop	af
	pop	af
	pop	af
	ld	c,l
	ld	b,h
	ld	hl,#0x3F00
	push	hl
	ld	hl,#0x0000
	push	hl
	push	de
	push	bc
	call	___fslt
	pop	af
	pop	af
	pop	af
	pop	af
	ld	a,l
	or	a, a
	jp	NZ,00114$
	inc	(ix + -2)
	jp	NZ,00148$
	inc	(ix + -1)
00148$:
00114$:
	.map	src/gpl/expf.c, 84, "xn=n;"
	ld	l,(ix + -2)
	ld	h,(ix + -1)
	push	hl
	call	___sint2fs
	pop	af
	ld	c,l
	ld	b,h
	.map	src/gpl/expf.c, 85, "g=((y-xn*C1))-xn*C2;"
	push	bc
	push	de
	push	de
	push	bc
	ld	hl,#0x3F31
	push	hl
	ld	hl,#0x8000
	push	hl
	call	___fsmul
	pop	af
	pop	af
	pop	af
	pop	af
	ld	(ix + -3),d
	ld	(ix + -4),e
	ld	(ix + -5),h
	ld	(ix + -6),l
	pop	de
	pop	bc
	push	bc
	push	de
	ld	l,(ix + -4)
	ld	h,(ix + -3)
	push	hl
	ld	l,(ix + -6)
	ld	h,(ix + -5)
	push	hl
	ld	l,(ix + -19)
	ld	h,(ix + -18)
	push	hl
	ld	l,(ix + -21)
	ld	h,(ix + -20)
	push	hl
	call	___fssub
	pop	af
	pop	af
	pop	af
	pop	af
	ld	(ix + -3),d
	ld	(ix + -4),e
	ld	(ix + -5),h
	ld	(ix + -6),l
	pop	de
	pop	bc
	push	de
	push	bc
	ld	hl,#0xB95E
	push	hl
	ld	hl,#0x8083
	push	hl
	call	___fsmul
	pop	af
	pop	af
	pop	af
	pop	af
	ex	de, hl
	push	hl
	push	de
	ld	l,(ix + -4)
	ld	h,(ix + -3)
	push	hl
	ld	l,(ix + -6)
	ld	h,(ix + -5)
	push	hl
	.map	src/gpl/expf.c, 86, "z=g*g;"
	call	___fssub
	pop	af
	pop	af
	pop	af
	pop	af
	ld	(ix + -3),d
	ld	(ix + -4),e
	ld	(ix + -5),h
	ld	(ix + -6),l
	ld	l,(ix + -4)
	ld	h,(ix + -3)
	push	hl
	ld	l,(ix + -6)
	ld	h,(ix + -5)
	push	hl
	ld	l,(ix + -4)
	ld	h,(ix + -3)
	push	hl
	ld	l,(ix + -6)
	ld	h,(ix + -5)
	push	hl
	.map	src/gpl/expf.c, 87, "r=P(z)*g;"
	call	___fsmul
	pop	af
	pop	af
	pop	af
	pop	af
	ld	(ix + -8),d
	ld	(ix + -9),e
	ld	(ix + -10),h
	ld	(ix + -11),l
	ld	l,(ix + -9)
	ld	h,(ix + -8)
	push	hl
	ld	l,(ix + -11)
	ld	h,(ix + -10)
	push	hl
	ld	hl,#0x3B88
	push	hl
	ld	hl,#0x5308
	push	hl
	call	___fsmul
	pop	af
	pop	af
	pop	af
	pop	af
	ld	c,l
	ld	b,h
	ld	hl,#0x3E80
	push	hl
	ld	hl,#0x0000
	push	hl
	push	de
	push	bc
	call	___fsadd
	pop	af
	pop	af
	pop	af
	pop	af
	ld	c,l
	ld	b,h
	ld	l,(ix + -4)
	ld	h,(ix + -3)
	push	hl
	ld	l,(ix + -6)
	ld	h,(ix + -5)
	push	hl
	push	de
	push	bc
	.map	src/gpl/expf.c, 88, "r=0.5+(r/(Q(z)-r));"
	call	___fsmul
	pop	af
	pop	af
	pop	af
	pop	af
	ld	(ix + -3),d
	ld	(ix + -4),e
	ld	(ix + -5),h
	ld	(ix + -6),l
	ld	l,(ix + -9)
	ld	h,(ix + -8)
	push	hl
	ld	l,(ix + -11)
	ld	h,(ix + -10)
	push	hl
	ld	hl,#0x3D4C
	push	hl
	ld	hl,#0xBF5B
	push	hl
	call	___fsmul
	pop	af
	pop	af
	pop	af
	pop	af
	ld	c,l
	ld	b,h
	ld	hl,#0x3F00
	push	hl
	ld	hl,#0x0000
	push	hl
	push	de
	push	bc
	call	___fsadd
	pop	af
	pop	af
	pop	af
	pop	af
	ld	c,l
	ld	b,h
	ld	l,(ix + -4)
	ld	h,(ix + -3)
	push	hl
	ld	l,(ix + -6)
	ld	h,(ix + -5)
	push	hl
	push	de
	push	bc
	call	___fssub
	pop	af
	pop	af
	pop	af
	pop	af
	ex	de, hl
	push	hl
	push	de
	ld	l,(ix + -4)
	ld	h,(ix + -3)
	push	hl
	ld	l,(ix + -6)
	ld	h,(ix + -5)
	push	hl
	call	___fsdiv
	pop	af
	pop	af
	pop	af
	pop	af
	ld	c,l
	ld	b,h
	ld	hl,#0x3F00
	push	hl
	ld	hl,#0x0000
	push	hl
	push	de
	push	bc
	call	___fsadd
	pop	af
	pop	af
	pop	af
	pop	af
	ld	(ix + -8),d
	ld	(ix + -9),e
	ld	(ix + -10),h
	ld	(ix + -11),l
	ld	hl, #5
	add	hl, sp
	ex	de, hl
	ld	hl, #11
	add	hl, sp
	ld	bc, #4
	ldir
	.map	src/gpl/expf.c, 90, "n++;"
	ld	a,(ix + -2)
	add	a, #0x01
	ld	(ix + -13),a
	ld	a,(ix + -1)
	adc	a, #0x00
	ld	(ix + -12),a
	.map	src/gpl/expf.c, 91, "z=ldexpf(r, n);"
	ld	l,(ix + -13)
	ld	h,(ix + -12)
	push	hl
	ld	l,(ix + -15)
	ld	h,(ix + -14)
	push	hl
	ld	l,(ix + -17)
	ld	h,(ix + -16)
	push	hl
	call	_ldexpf
	pop	af
	pop	af
	pop	af
	ld	(ix + -8),d
	ld	(ix + -9),e
	ld	(ix + -10),h
	ld	(ix + -11),l
	.map	src/gpl/expf.c, 92, "if(sign)"
	bit	0,(ix + -22)
	jp	Z,00116$
	.map	src/gpl/expf.c, 93, "return 1.0/z;"
	ld	l,(ix + -9)
	ld	h,(ix + -8)
	push	hl
	ld	l,(ix + -11)
	ld	h,(ix + -10)
	push	hl
	ld	hl,#0x3F80
	push	hl
	ld	hl,#0x0000
	push	hl
	call	___fsdiv
	pop	af
	pop	af
	pop	af
	pop	af
	ld	(ix + -3),d
	ld	(ix + -4),e
	ld	(ix + -5),h
	ld	(ix + -6), l
	ld	h,(ix + -5)
	ld	e,(ix + -4)
	ld	d,(ix + -3)
	jp	00118$
00116$:
	.map	src/gpl/expf.c, 95, "return z;"
	ld	l,(ix + -11)
	ld	h,(ix + -10)
	ld	e,(ix + -9)
	ld	d,(ix + -8)
00118$:
	ld	sp, ix
	pop	ix
	ret
	_expf_end::
.function	_expf, _expf_start, _expf_end
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
