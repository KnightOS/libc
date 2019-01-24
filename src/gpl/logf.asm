;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.4.1 #9072 (Jan 24 2019) (Linux)
; This file was generated Thu Jan 24 08:46:17 2019
;--------------------------------------------------------
	.module logf
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _frexpf
	.globl _logf
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
	.map	src/gpl/logf.c, 47, "float logf(float x)"
;	---------------------------------
; Function logf
; ---------------------------------
_logf_start::
_logf:
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	hl,#-19
	add	hl,sp
	ld	sp,hl
	.map	src/gpl/logf.c, 53, "if (x<=0.0)"
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
	ld	c,l
	ld	a,c
	or	a, a
	jp	NZ,00102$
	.map	src/gpl/logf.c, 55, "errno=EDOM;"
	ld	iy,#_errno
	ld	(iy + 0),#0x21
	ld	iy,#_errno
	ld	(iy + 1),#0x00
	.map	src/gpl/logf.c, 56, "return 0.0;"
	ld	hl,#0x0000
	ld	e,l
	ld	d,h
	jp	00106$
00102$:
	.map	src/gpl/logf.c, 58, "f=frexpf(x, &n);"
	ld	hl,#0x0000
	add	hl,sp
	push	hl
	ld	l,(ix + 6)
	ld	h,(ix + 7)
	push	hl
	ld	l,(ix + 4)
	ld	h,(ix + 5)
	push	hl
	call	_frexpf
	pop	af
	pop	af
	pop	af
	ld	(ix + -2),d
	ld	(ix + -3),e
	ld	(ix + -4),h
	ld	(ix + -5),l
	.map	src/gpl/logf.c, 59, "znum=f-0.5;"
	ld	hl,#0x3F00
	push	hl
	ld	hl,#0x0000
	push	hl
	ld	l,(ix + -3)
	ld	h,(ix + -2)
	push	hl
	ld	l,(ix + -5)
	ld	h,(ix + -4)
	push	hl
	call	___fssub
	pop	af
	pop	af
	pop	af
	pop	af
	ld	(ix + -6),d
	ld	(ix + -7),e
	ld	(ix + -8),h
	ld	(ix + -9),l
	ld	hl, #6
	add	hl, sp
	ex	de, hl
	ld	hl, #10
	add	hl, sp
	ld	bc, #4
	ldir
	.map	src/gpl/logf.c, 60, "if (f>C0)"
	ld	hl,#0x3F35
	push	hl
	ld	hl,#0x04F3
	push	hl
	ld	l,(ix + -3)
	ld	h,(ix + -2)
	push	hl
	ld	l,(ix + -5)
	ld	h,(ix + -4)
	push	hl
	call	___fsgt
	pop	af
	pop	af
	pop	af
	pop	af
	ld	(ix + -1), l
	ld	a, l
	or	a, a
	jp	Z,00104$
	.map	src/gpl/logf.c, 62, "znum-=0.5;"
	ld	hl,#0x3F00
	push	hl
	ld	hl,#0x0000
	push	hl
	ld	l,(ix + -7)
	ld	h,(ix + -6)
	push	hl
	ld	l,(ix + -9)
	ld	h,(ix + -8)
	push	hl
	call	___fssub
	pop	af
	pop	af
	pop	af
	pop	af
	ld	(ix + -13),l
	ld	(ix + -12),h
	ld	(ix + -11),e
	ld	(ix + -10),d
	.map	src/gpl/logf.c, 63, "zden=(f*0.5)+0.5;"
	ld	l,(ix + -3)
	ld	h,(ix + -2)
	push	hl
	ld	l,(ix + -5)
	ld	h,(ix + -4)
	push	hl
	ld	hl,#0x3F00
	push	hl
	ld	hl,#0x0000
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
	ld	(ix + -17),l
	ld	(ix + -16),h
	ld	(ix + -15),e
	ld	(ix + -14),d
	jp	00105$
00104$:
	.map	src/gpl/logf.c, 67, "n--;"
	pop	hl
	push	hl
	dec	hl
	ex	(sp), hl
	.map	src/gpl/logf.c, 68, "zden=znum*0.5+0.5;"
	ld	l,(ix + -7)
	ld	h,(ix + -6)
	push	hl
	ld	l,(ix + -9)
	ld	h,(ix + -8)
	push	hl
	ld	hl,#0x3F00
	push	hl
	ld	hl,#0x0000
	push	hl
	call	___fsmul
	pop	af
	pop	af
	pop	af
	pop	af
	ld	(ix + -6),d
	ld	(ix + -7),e
	ld	(ix + -8),h
	ld	(ix + -9),l
	ld	hl,#0x3F00
	push	hl
	ld	hl,#0x0000
	push	hl
	ld	l,(ix + -7)
	ld	h,(ix + -6)
	push	hl
	ld	l,(ix + -9)
	ld	h,(ix + -8)
	push	hl
	call	___fsadd
	pop	af
	pop	af
	pop	af
	pop	af
	ld	(ix + -6),d
	ld	(ix + -7),e
	ld	(ix + -8),h
	ld	(ix + -9),l
	ld	hl, #2
	add	hl, sp
	ex	de, hl
	ld	hl, #10
	add	hl, sp
	ld	bc, #4
	ldir
00105$:
	.map	src/gpl/logf.c, 70, "z=znum/zden;"
	ld	l,(ix + -15)
	ld	h,(ix + -14)
	push	hl
	ld	l,(ix + -17)
	ld	h,(ix + -16)
	push	hl
	ld	l,(ix + -11)
	ld	h,(ix + -10)
	push	hl
	ld	l,(ix + -13)
	ld	h,(ix + -12)
	push	hl
	.map	src/gpl/logf.c, 71, "w=z*z;"
	call	___fsdiv
	pop	af
	pop	af
	pop	af
	pop	af
	ld	(ix + -6),d
	ld	(ix + -7),e
	ld	(ix + -8),h
	ld	(ix + -9),l
	ld	l,(ix + -7)
	ld	h,(ix + -6)
	push	hl
	ld	l,(ix + -9)
	ld	h,(ix + -8)
	push	hl
	ld	l,(ix + -7)
	ld	h,(ix + -6)
	push	hl
	ld	l,(ix + -9)
	ld	h,(ix + -8)
	push	hl
	.map	src/gpl/logf.c, 73, "Rz=z+z*(w*A(w)/B(w));"
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
	ld	hl,#0xBF0D
	push	hl
	ld	hl,#0x7E3D
	push	hl
	call	___fsmul
	pop	af
	pop	af
	pop	af
	pop	af
	ld	(ix + -2),d
	ld	(ix + -3),e
	ld	(ix + -4),h
	ld	(ix + -5),l
	pop	de
	pop	bc
	ld	hl,#0xC0D4
	push	hl
	ld	hl,#0x3F3A
	push	hl
	push	de
	push	bc
	call	___fsadd
	pop	af
	pop	af
	pop	af
	pop	af
	ex	de, hl
	push	hl
	push	de
	ld	l,(ix + -3)
	ld	h,(ix + -2)
	push	hl
	ld	l,(ix + -5)
	ld	h,(ix + -4)
	push	hl
	call	___fsdiv
	pop	af
	pop	af
	pop	af
	pop	af
	ex	de, hl
	push	hl
	push	de
	ld	l,(ix + -7)
	ld	h,(ix + -6)
	push	hl
	ld	l,(ix + -9)
	ld	h,(ix + -8)
	push	hl
	call	___fsmul
	pop	af
	pop	af
	pop	af
	pop	af
	ex	de, hl
	push	hl
	push	de
	ld	l,(ix + -7)
	ld	h,(ix + -6)
	push	hl
	ld	l,(ix + -9)
	ld	h,(ix + -8)
	push	hl
	.map	src/gpl/logf.c, 74, "xn=n;"
	call	___fsadd
	pop	af
	pop	af
	pop	af
	pop	af
	ld	(ix + -6),d
	ld	(ix + -7),e
	ld	(ix + -8),h
	ld	(ix + -9),l
	pop	hl
	push	hl
	push	hl
	call	___sint2fs
	pop	af
	ld	c,l
	ld	b,h
	.map	src/gpl/logf.c, 75, "return ((xn*C2+Rz)+xn*C1);"
	push	bc
	push	de
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
	ld	(ix + -2),d
	ld	(ix + -3),e
	ld	(ix + -4),h
	ld	(ix + -5),l
	pop	de
	pop	bc
	push	bc
	push	de
	ld	l,(ix + -7)
	ld	h,(ix + -6)
	push	hl
	ld	l,(ix + -9)
	ld	h,(ix + -8)
	push	hl
	ld	l,(ix + -3)
	ld	h,(ix + -2)
	push	hl
	ld	l,(ix + -5)
	ld	h,(ix + -4)
	push	hl
	call	___fsadd
	pop	af
	pop	af
	pop	af
	pop	af
	ld	(ix + -6),d
	ld	(ix + -7),e
	ld	(ix + -8),h
	ld	(ix + -9),l
	pop	de
	pop	bc
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
	ex	de, hl
	push	hl
	push	de
	ld	l,(ix + -7)
	ld	h,(ix + -6)
	push	hl
	ld	l,(ix + -9)
	ld	h,(ix + -8)
	push	hl
	call	___fsadd
	pop	af
	pop	af
	pop	af
	pop	af
00106$:
	ld	sp, ix
	pop	ix
	ret
	_logf_end::
.function	_logf, _logf_start, _logf_end
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
