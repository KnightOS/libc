#include <knightos/color.h>
#include <kernel.h>
#include <stdbool.h>

bool is_legacy() {
	__asm
	PCALL(CHECKLEGACYLCDMODE)
	LD L, 0
	JR Z, .legacy
.legacy:
	INC L
	__endasm;
}

bool color_supported() {
	__asm
	PCALL(COLORSUPPORTED)
	LD L, 0
	JR NZ, .notSupported
	INC L
.notSupported:
	LD (_errno), A
	__endasm;
}

void reset_legacy_lcd_mode() {
	__asm
	PCALL(RESETLEGACYLCDMODE)
	__endasm;
}

void clear_color_lcd(char *color) {
	__asm
	POP IY ; color
		PCALL(CLEARCOLORLCD)
	PUSH IY
	__endasm;
	color;
}

void color_lcd_off() {
	__asm
	PCALL(COLORLCDOFF)
	__endasm;
}

void color_lcd_on() {
	__asm
	PCALL(COLORLCDON)
	__endasm;
}

void write_lcd_register(char reg, char *value) {
	__asm
	POP DE ; return
	DEC SP
	POP AF ; reg
	POP HL ; value
	PCALL(WRITELCDREGISTER)
	PUSH HL
	PUSH AF
	INC SP 
	PUSH DE
	__endasm;
	reg; value;
}

void clip_color_rectangle(unsigned short color, char height, short width, short x, char y) {
	__asm
	POP AF ; return addr
	POP IY ; color
	DEC SP
	POP BC ; height
	POP DE ; width
	POP HL ; x, y
		LD C, B
		LD B, L
		PCALL(CLIPCOLORRECTANGLE)
	PUSH HL
	PUSH DE
	PUSH BC
	INC SP
	PUSH IY
	PUSH AF 
	__endasm;
	color; height; width; x; y;
}