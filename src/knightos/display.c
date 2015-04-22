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

void screen_clear(SCREEN *screen) {
	__asm
	POP IX
	POP IY
	PCALL(CLEARBUFFER)
	PUSH IY
	PUSH IX
	__endasm;
	screen;
}

void screen_draw(SCREEN *screen) {
	__asm
	POP IX
	POP IY
	PCALL(FASTCOPY)
	PUSH IY
	PUSH IX
	__endasm;
	screen;
}

void set_left_margin(unsigned char margin) {
	left_margin = margin;
}

void draw_string(SCREEN *screen, unsigned char x, unsigned char y, const char *string) {
	__asm
	POP IX ; Return point
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
	PUSH IX
	__endasm;
	screen; x; y; string;
}

void draw_sprite(SCREEN *screen, unsigned char x, unsigned char y, unsigned char height, const void *sprite) {
	__asm
	POP IX ; Return point
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
	PUSH IX
	__endasm;
	screen; x; y; height; sprite;
}

void draw_char(SCREEN *screen, unsigned char x, unsigned char y, unsigned char value) {
	__asm
	POP IX
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
	PUSH IX
	__endasm;
	screen; x; y; value;
}

void draw_short(SCREEN *screen, unsigned char x, unsigned char y, unsigned short value) {
	__asm
	POP IX
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
	PUSH IX
	__endasm;
	screen; x; y; value;
}
