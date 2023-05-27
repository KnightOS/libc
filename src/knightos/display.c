#include <knightos/display.h>
#include <kernel.h>

unsigned char left_margin = 0;

SCREEN *screen_allocate() __naked {
	__asm
	PCALL(ALLOCSCREENBUFFER)
	PUSH IY
	POP HL
	RET
	__endasm;
}

void screen_clear(SCREEN *screen) __naked {
	__asm
	POP HL
	POP IY
	PCALL(CLEARBUFFER)
	PUSH IY
	PUSH HL
	RET
	__endasm;
	screen;
}

void screen_draw(SCREEN *screen) __naked {
	__asm
	POP HL
	POP IY
	PCALL(FASTCOPY)
	PUSH IY
	PUSH HL
	RET
	__endasm;
	screen;
}

void set_left_margin(unsigned char margin) {
	left_margin = margin;
}

void *saved_return_point;

void draw_char(SCREEN *screen, unsigned char x, unsigned char y, unsigned char value) __naked {
	__asm
	POP HL ; Return point
	ld (_saved_return_point), hl
	POP IY ; screen
	POP DE ; x, y
		ld a, d
		ld d, e
		ld e, a
	DEC SP
	POP AF ; value
		PCALL(DRAWCHAR)
	PUSH AF
	INC SP
	PUSH DE
	PUSH IY
	ld hl, (_saved_return_point)
	PUSH HL
	RET
	__endasm;
	screen; x; y; value;
}

void draw_string(SCREEN *screen, unsigned char x, unsigned char y, const char *string) __naked {
	__asm
	POP HL ; Return point
	ld (_saved_return_point), hl
	POP IY ; screen
	POP DE ; x, y
	ld hl, _left_margin
	ld b, (hl)
	POP HL ; string
		ld a, d
		ld d, e
		ld e, a
		PCALL(DRAWSTR)
	PUSH HL
	PUSH DE
	PUSH IY
	ld hl, (_saved_return_point)
	PUSH HL
	RET
	__endasm;
	screen; x; y; string;
}

void draw_line(SCREEN *screen, unsigned char x1, unsigned char y1, unsigned char x2, unsigned char y2) __naked{
	__asm
	POP HL ; Return point
	ld (_saved_return_point), hl
	POP IY ; screen
	POP DE ; x1, y1
	POP HL ; x2, y2
		ld a, d ; swap de
		ld d, e
		ld e, a

		ld a, h ; swap hl
		ld h, l
		ld l, a
		PCALL(DRAWLINE)
	PUSH HL
	PUSH DE
	PUSH IY
	ld hl, (_saved_return_point)
	PUSH HL
	RET
	__endasm;
	screen; x1; y1; x2; y2;
}

void draw_v_line(SCREEN *screen, unsigned char x, unsigned char y, unsigned char height)  {
	draw_line(screen, x, y, x, y + height);
}

void draw_sprite(SCREEN *screen, unsigned char x, unsigned char y, unsigned char height, const void *sprite, GFX_BLEND_MODE blend_mode) {
	switch (blend_mode) {
	case GFX_AND:
		draw_sprite_and(screen, x, y, height, sprite);
		break;
	case GFX_OR:
		draw_sprite_or(screen, x, y, height, sprite);
		break;
 	case GFX_XOR:
		draw_sprite_xor(screen, x, y, height, sprite);
		break;
    }
}

void draw_sprite_and(SCREEN *screen, unsigned char x, unsigned char y, unsigned char height, const void *sprite) {
	__asm
	POP HL ; Return point
	ld (_saved_return_point), hl
	POP IY ; screen
	POP DE ; x, y
	DEC SP
	POP BC ; height
	POP HL ; sprite
		ld a, d
		ld d, e
		ld e, a
		PCALL(PUTSPRITEAND)
	PUSH HL
	PUSH BC
	INC SP
	PUSH DE
	PUSH IY
	ld hl, (_saved_return_point)
	PUSH HL
	__endasm;
	screen; x; y; height; sprite;
}

void draw_sprite_or(SCREEN *screen, unsigned char x, unsigned char y, unsigned char height, const void *sprite) {
	__asm
	POP HL ; Return point
	ld (_saved_return_point), hl
	POP IY ; screen
	POP DE ; x, y
	DEC SP
	POP BC ; height
	POP HL ; sprite
		ld a, d
		ld d, e
		ld e, a
		PCALL(PUTSPRITEOR)
	PUSH HL
	PUSH BC
	INC SP
	PUSH DE
	PUSH IY
	ld hl, (_saved_return_point)
	PUSH HL
	__endasm;
	screen; x; y; height; sprite;
}

void draw_sprite_xor(SCREEN *screen, unsigned char x, unsigned char y, unsigned char height, const void *sprite) {
	__asm
	POP HL ; Return point
	ld (_saved_return_point), hl
	POP IY ; screen
	POP DE ; x, y
	DEC SP
	POP BC ; height
	POP HL ; sprite
		ld a, d
		ld d, e
		ld e, a
		PCALL(PUTSPRITEXOR)
	PUSH HL
	PUSH BC
	INC SP
	PUSH DE
	PUSH IY
	ld hl, (_saved_return_point)
	PUSH HL
	__endasm;
	screen; x; y; height; sprite;
}

void draw_rectangle(SCREEN *screen, unsigned char width, unsigned char height, unsigned char x, unsigned char y, GFX_BLEND_MODE blend_mode) {
	switch (blend_mode) {
	case GFX_AND:
		draw_rect_and(screen, width, height, x, y);
		break;
	case GFX_OR:
		draw_rect_or(screen, width, height, x, y);
		break;
 	case GFX_XOR:
		draw_rect_xor(screen, width, height, x, y);
		break;
    }
}

void draw_rect_or(SCREEN *screen, unsigned char width, unsigned char height, unsigned char x, unsigned char y) {
	__asm
	POP HL ; Return point
	ld (_saved_return_point), hl
	POP IY ; screen
	POP BC ; width, height
	POP DE ; x, y
		ld a, b
		ld b, c
		ld c, a

		ld a, d
		ld l, e
		ld e, a

		PCALL(RECTOR)
	PUSH DE
	PUSH BC
	PUSH IY
	ld hl, (_saved_return_point)
	PUSH HL
	__endasm;
	screen; width; height; x; y;
}

void draw_rect_and(SCREEN *screen, unsigned char width, unsigned char height, unsigned char x, unsigned char y) {
	__asm
	POP HL ; Return point
	ld (_saved_return_point), hl
	POP IY ; screen
	POP BC ; width, height
	POP DE ; x, y
		ld a, b
		ld b, c
		ld c, a

		ld a, d
		ld l, e
		ld e, a

		PCALL(RECTAND)
	PUSH DE
	PUSH BC
	PUSH IY
	ld hl, (_saved_return_point)
	PUSH HL
	__endasm;
	screen; width; height; x; y;
}

void draw_rect_xor(SCREEN *screen, unsigned char width, unsigned char height, unsigned char x, unsigned char y) {
	__asm
	POP HL ; Return point
	ld (_saved_return_point), hl
	POP IY ; screen
	POP BC ; width, height
	POP DE ; x, y
		ld a, b
		ld b, c
		ld c, a

		ld a, d
		ld l, e
		ld e, a

		PCALL(RECTXOR)
	PUSH DE
	PUSH BC
	PUSH IY
	ld hl, (_saved_return_point)
	PUSH HL
	__endasm;
	screen; width; height; x; y;
}

void draw_byte(SCREEN *screen, unsigned char x, unsigned char y, unsigned char value) {
	__asm
	POP BC
	POP IY
	POP DE
		ld a, d
		ld d, e
		ld e, a
	DEC SP
	POP AF
		PCALL(DRAWDECA)
	PUSH AF
	INC SP
	PUSH DE
	PUSH IY
	PUSH BC
	__endasm;
	screen; x; y; value;
}

void draw_short(SCREEN *screen, unsigned char x, unsigned char y, unsigned short value) {
	__asm
	POP BC
	POP IY
	POP DE
	POP HL
		ld a, d
		ld d, e
		ld e, a
		PCALL(DRAWDECHL)
	PUSH HL
	PUSH DE
	PUSH IY
	PUSH BC
	__endasm;
	screen; x; y; value;
}

void draw_signed(SCREEN* screen, unsigned char x, unsigned char y, signed short value) {
    if(value < 0){
        draw_char(screen, x, y, '-');
        x += 4;
        value = -value;
    }
    draw_short(screen, x, y, value);
    return;
}

void draw_float(SCREEN* screen, unsigned char x, unsigned char y, float value){
    /* Implementation is weird and slow because of non-working snprintf. Indeed, %f format strings are not yet implemented */
    unsigned int integer_part;
    unsigned int frac_part;
    unsigned int integer_part_len;
    bool sgn = (value < 0);
    
    
    value = sgn ? -value : value;
    
    integer_part = (unsigned int)value;
    frac_part = ((value - (float)integer_part)*10000);
    
    integer_part_len = (log10u(integer_part)) + 1;
    
    if(sgn){
        draw_char(screen, x, y, '-');
        x += 4;
    }
    
    draw_short(screen, x, y, integer_part);
    x +=  integer_part_len*4;
    draw_char(screen, x, y, '.');
    
    x += 4;
    draw_short(screen, x, y, frac_part);

    return;
}

void invert_pixel(SCREEN *screen, char x, char y) {
	__asm
	POP BC ; return
	POP IY ; screen
	DEC SP
	POP AF ; x
	DEC SP
	POP HL ; y
	; Swap H and L
		ld l, h
		PCALL(INVERTPIXEL)
	PUSH HL
	INC SP
	PUSH AF
	INC SP
	PUSH IY
	PUSH BC
	__endasm;
	screen; x; y;
}
void reset_pixel(SCREEN *screen, char x, char y) {
	__asm
	POP BC ; return
	POP IY ; screen
	DEC SP
	POP AF ; x
	DEC SP
	POP HL ; y
	; Swap H and L
		ld l, h
		PCALL(RESETPIXEL)
	PUSH HL
	INC SP
	PUSH AF
	INC SP
	PUSH IY
	PUSH BC
	__endasm;
	screen; x; y;
}

void set_pixel(SCREEN *screen, char x, char y) {
	__asm
	POP BC ; return
	POP IY ; screen
	DEC SP
	POP AF ; x
	DEC SP
	POP HL ; y
	; Swap H and L
		ld l, h
		PCALL(SETPIXEL)
	PUSH HL
	INC SP
	PUSH AF
	INC SP
	PUSH IY
	PUSH BC
	__endasm;
	screen; x; y;
}
