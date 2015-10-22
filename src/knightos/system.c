#include <knightos/system.h>
#include <kernel.h>
#include <stddef.h>

void get_lcd_lock() __naked {
	__asm
	PCALL(GETLCDLOCK)
	RET
	__endasm;
}

void get_keypad_lock() __naked {
	__asm
	PCALL(GETKEYPADLOCK)
	RET
	__endasm;
}

void get_io_lock() __naked {
	__asm
	PCALL(GETIOLOCK)
	RET
	__endasm;
}

void ksleep(unsigned short msecs) __naked {
	__asm
	POP DE
	POP HL
		PCALL(SLEEP)
	PUSH HL
	PUSH DE
	RET
	__endasm;
	msecs;
}

void *malloc(size_t size) __naked {
	__asm
	POP DE
	POP BC
		PCALL(MALLOC)
		PUSH IX
		POP HL
	PUSH BC
	PUSH DE
	RET
	__endasm;
	size;
}

void *realloc(void *ptr, size_t size) __naked {
	__asm
	POP DE
	POP BC
	POP IX
		PCALL(REALLOC)
		PUSH IX
		POP HL
	PUSH IX
	PUSH BC
	PUSH DE
	RET
	__endasm;
	ptr; size;
}

void free(void *ptr) {
	__asm
	POP DE
	POP IX
		PCALL(FREE)
	PUSH IX
	PUSH DE
	__endasm;
	ptr;
}

void *calloc(size_t nmemb, size_t size) {
	return malloc(nmemb * size);
}

void load_library(const char *path) {
	__asm
	POP IX
	POP DE
		PCALL(LOADLIBRARY)
	PUSH DE
	PUSH IX
	__endasm;
	path;
}

unsigned char get_random() __naked {
	__asm
	PCALL(GETRANDOM)
	LD L, A
	ret
	__endasm;
}
Outputs
