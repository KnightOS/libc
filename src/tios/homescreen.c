#include <stdint.h>
#include <tios/homescreen.h>
#include <tios/bcall.h>

void home_up() __naked {
	__asm
	BCALL(BCALL_HOMEUP)
	RET
	__endasm;
}

void clr_lcd_full() __naked {
	__asm
	BCALL(BCALL_CLRLCDFULL);
	RET
	__endasm;
}

void puts(const char *s) {
	__asm
	POP BC
	POP HL
		BCALL(BCALL_PUTS);
	PUSH HL
	PUSH BC
	RET
	__endasm;
	s;
}

void set_currow(unsigned char col, unsigned char row) __naked {
	// TODO
	__asm
	RET
	__endasm;
	col; row;
}

void newline() __naked {
	__asm
	BCALL(BCALL_NEWLINE);
	RET
	__endasm;
}
