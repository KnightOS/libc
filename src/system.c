#include <system.h>
#include <kernel.h>

void *malloc(unsigned short size) __naked {
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

void *realloc(void *ptr) __naked {
	__asm
	POP DE
	POP IX
		PCALL(REALLOC)
		PUSH IX
		POP HL
	PUSH IX
	PUSH DE
	RET
	__endasm;
	ptr;
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

void *calloc(unsigned short nmemb, unsigned short size) {
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
