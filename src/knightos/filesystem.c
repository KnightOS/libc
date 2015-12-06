#include <knightos/filesystem.h>
#include <stdbool.h>
#include <kernel.h>

bool directory_exists(char *path) {
	__asm
	POP IX ; Return point
	POP DE ; path
		PCALL(DIRECTORYEXISTS)
	PUSH DE ; restore path
	LD L, 0
	JR NZ, .notExists
	INC L
.notExists:
	JP (IX)
	__endasm;
	path;
}

unsigned char create_directory(char *path, struct flash_ptr *address) {
	__asm
	POP IX ; Return point
	POP DE ; path
		PCALL(CREATEDIRECTORY)
	LD B, H
	LD C, L
	POP HL ; address
	PUSH HL ; restore address
	PUSH DE ; restore path
	JR NZ, .error
	LD (HL), C
	INC HL
	LD (HL), B
	INC HL
	LD (HL), A
	XOR A
.error:
	LD L, A
	JP (IX)
	__endasm;
	path; address; 

}
