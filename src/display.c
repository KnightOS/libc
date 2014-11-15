#include <kernel.h>
typedef unsigned char SCREEN;

unsigned char left_margin;

void get_lcd_lock() __naked {
	__asm
	PCALL(GETLCDLOCK)
	RET
	__endasm;
}
