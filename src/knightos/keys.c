#include <knightos/keys.h>
#include <kernel.h>

unsigned char get_key() __naked {
	__asm
	PCALL(GETKEY)
	LD L, A
	RET
	__endasm;
}

unsigned char wait_key() __naked {
	__asm
	PCALL(WAITKEY)
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
