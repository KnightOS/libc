#include <knightos/keys.h>
#include <kernel.h>

unsigned char get_key() __naked {
	__asm
	POP IX
	POP HL
		PCALL(GETKEY)
	PUSH HL
	PUSH IX
	LD L, A
	RET
	__endasm;
}

unsigned char wait_key() __naked {
	__asm
	POP IX
	POP HL
		PCALL(GETKEY)
	PUSH HL
	PUSH IX
	LD L, A
	RET
	__endasm;
}

void flush_keys() __naked {
	__asm
	PCALL(FLUSHKEYS)
	RET
	__endasm;
}
