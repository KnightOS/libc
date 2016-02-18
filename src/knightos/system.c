#include <knightos/system.h>
#include <kernel.h>
#include <stddef.h>
#include <errno.h>

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
	POP HL
	POP BC
	PUSH BC
	PUSH IX
	PCALL(MALLOC)
	EX (SP), IX
	EX (SP), HL
	RET Z ; Z is set on success
	LD (_errno), A
	LD HL, 0
	RET
	__endasm;
	size;
}

void *realloc(void *ptr, size_t size) __naked {
	__asm
	POP HL
	POP DE
	POP BC
	PUSH BC
	PUSH DE ; replace on stack and pop another copy to IX 
	PUSH DE
	EX (SP), IX
	PCALL(REALLOC)
	EX (SP), IX
	EX (SP), HL
	RET Z
	LD HL, 0 ; NULL
	__endasm;
	ptr; size;
}

void free(void *ptr) {
	__asm
	POP HL
	EX (SP), IX
	PCALL(FREE)
	EX (SP), IX
	JP (HL)
	__endasm;
	ptr;
}

void *calloc(size_t nmemb, size_t size) {
	return malloc(nmemb * size);
}

void load_library(const char *path) {
	__asm
	POP HL
	POP DE
		PCALL(LOADLIBRARY)
	PUSH DE
	PUSH HL
	__endasm;
	path;
}

unsigned char get_random() __naked {
	__asm
	PCALL(GETRANDOM)
	LD L, A
	RET
	__endasm;
}

void reboot() {
	__asm
	POP HL
	PCALL(REBOOT)
	PUSH HL
	__endasm;
}

void suspend_device() {
	__asm
	POP HL
	PCALL(SUSPENDDEVICE)
	PUSH HL
	__endasm;
}