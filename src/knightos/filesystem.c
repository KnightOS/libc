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

unsigned char create_directory(char *path) {
	__asm
	POP IX ; Return point
	POP DE ; path
		PCALL(CREATEDIRECTORY)
	PUSH DE ; restore path
	LD L, 0
	JR NZ, .error
	INC L
.error:
	LD (_errno), A
	JP (IX)
	__endasm;
	path; 

}