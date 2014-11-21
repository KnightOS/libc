#include <display.h>
#include <kernel.h>

inline void get_lcd_lock() {
	__asm
	PCALL(GETLCDLOCK)
	__endasm;
}
