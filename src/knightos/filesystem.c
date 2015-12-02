#include <knightos/filesystem.h>
#include <kernel.h>

unsigned char check_filesystem() {
	__asm
	POP IX
	PCALL(CHECKKFS)
		PUSH AF
			LD A, 0
			JR Z, CHECK_FILESYSTEM_RETURN
			INC A
CHECK_FILESYSTEM_RETURN:
			LD (HL), A
		POP AF			
	PUSH IX
	__endasm;
}