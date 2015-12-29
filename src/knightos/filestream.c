#include <knightos/filestream.h>
#include <kernel.h>
#include <stdbool.h>

char open_file_read(const char *path) {
	__asm
	POP BC ; return address
	POP DE ; path
		PCALL(OPENFILEREAD) ; dont PUSH DE because this returns it
	JR Z, .error ; Z is reset on error
	LD L, D ; file stream_id
	PUSH BC
.error:
	LD (_errno), A
	PUSH BC
	__endasm;
	path;
}

char open_file_write(const char *path) {
	__asm
	POP BC ; return address
	POP DE ; path
		PCALL(OPENFILEWRITE) ; dont restore DE because this returns it
	JR Z, .error ; Z is reset on error
	LD L, D  ; file stream_id
	PUSH BC
.error:
	LD (_errno), A
	PUSH BC
	__endasm;
	path;
}

bool close_stream(char stream_id) {
	__asm
	POP HL ; Return point
	DEC SP
	POP DE ; stream_id
		PCALL(CLOSESTREAM)
	PUSH DE ; restore path
	INC SP
	LD L, 0
	JR Z, .notset
	INC L
.notset:
	JP (HL)
	__endasm;
	stream_id;
}

bool write_byte(char stream_id, char value) {
	__asm
	POP HL ; return value
	DEC SP
	POP DE ; stream_id
	DEC SP
	POP AF ; value
		PCALL(STREAMWRITEBYTE)
	PUSH AF
	INC SP
	PUSH DE
	INC SP
	LD L, 0
	JR Z, .error
	INC L
.error:
	ld (_errno), A
	JP (HL)
	__endasm;
	stream_id; value;
}

bool write_word(char stream_id, char *value) {
	__asm
	POP BC ; return value
	DEC SP
	POP DE ; stream_id
	POP HL ; value
		PCALL(STREAMWRITEWORD)
	PUSH HL
	PUSH DE
	INC SP
	LD L, 0
	JR Z, .error
	INC L
	PUSH BC
.error:
	LD (_errno), A
	PUSH BC
	__endasm;
	stream_id; value;
}

char read_byte(char stream_id) {
	__asm
	POP HL ; return address
	DEC SP
	POP DE ; stream_id
		PCALL(STREAMREADBYTE)
	PUSH DE
	INC SP
	LD L, 0
	JR Z, .error
	INC L
.error:
	LD (_errno), A
	JP (HL)
	__endasm;
	stream_id;
}
