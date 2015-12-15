#include <knightos/filesystem.h>
#include <stdbool.h>
#include <kernel.h>

bool directory_exists(char *path) {
	__asm
	POP HL ; Return point
	POP DE ; path
		PCALL(DIRECTORYEXISTS)
	PUSH DE ; restore path
	LD L, 0
	JR NZ, .notExists
	INC L
.notExists:
	JP (HL)
	__endasm;
	path;
}

bool create_directory(char *path) {
	__asm
	POP HL ; Return point
	POP DE ; path
		PCALL(CREATEDIRECTORY)
	PUSH DE ; restore path
	LD L, 0
	JR NZ, .error
	INC L
.error:
	LD (_errno), A
	JP (HL)
	__endasm;
	path; 

}