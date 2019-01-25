#include <knightos/color.h>
#include <kernel.h>
#include <stdbool.h>

bool is_legacy() __naked {
	__asm
	PCALL(CHECKLEGACYLCDMODE)
	LD L, 0
	RET NZ
.legacy:
	INC L
    RET
	__endasm;
}

bool color_supported() __naked {
	__asm
	PCALL(COLORSUPPORTED)
	LD L, 0
	JR NZ, .notSupported
	INC L
    RET
.notSupported:
	LD (_errno), A
    RET
	__endasm;
}

void reset_legacy_lcd_mode() {
	__asm
	PCALL(RESETLEGACYLCDMODE)
	__endasm;
}

void clear_color_lcd(uint16_t *color) {
	__asm
	POP DE ; return address
	POP IY ; color
		PCALL(CLEARCOLORLCD)
	PUSH IY
	PUSH DE
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

void clip_color_rectangle(uint16_t color, char height, short width, short x, char y) {
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

void set_lcd_window(uint8_t top_border, uint8_t bottom_border, uint16_t right_border, uint16_t left_border) {
	__asm
	POP AF ; return
	POP BC ; top_border, bottom_border
	POP DE ; right_border
	POP HL ; left_border
		LD A, C ; swap top_border and bottom_border
		LD C, B
		LD B, A
		PCALL(SETLCDWINDOW)
	PUSH HL
	PUSH DE
	PUSH BC
	PUSH AF
	__endasm;
	top_border; right_border; bottom_border; left_border;
}
