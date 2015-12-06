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
	PUSH IX
	LD IX, 0
	ADD IX, SP

	LD B, (IX + 5)
	LD C, (IX + 4)

	PCALL(MALLOC)
	PUSH IX \ POP HL

	JR Z, __malloc_done

	LD HL, 0 ; NULL
	POP IX
	RET

__malloc_done:
	POP IX
	RET
	__endasm;
	size;
}

void *realloc(void *ptr, size_t size) __naked {
	__asm
	PUSH IX
	LD IX, 0
	ADD IX, SP

	LD D, (IX + 5)
	LD E, (IX + 4)

	LD B, (IX + 7)
	LD C, (IX + 6)

	PUSH DE \ POP IX

	PCALL(REALLOC)
	PUSH IX \ POP HL

	JR Z, __realloc_done

	LD HL, 0 ; NULL
	POP IX
	RET

__realloc_done:
	POP IX
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
