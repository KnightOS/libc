#include <strings.h>
#include <ctype.h>

int ffs(int i) __naked {
	__asm
	POP IX
	POP HL
		LD B, 8
		LD A, -1
__ffs_loop:
		INC A
		SRA H
		JR C, __ffs_found
		DJNZ __ffs_loop
		LD B, 8
__ffs_loop_2:
		INC A
		SRA L
		JR C, __ffs_found
		DJNZ __ffs_loop_2
		XOR A
__ffs_found:
		LD L, A
	PUSH HL
	PUSH IX
	RET
	__endasm;
	i;
}

int strcasecmp(const char *s1, const char *s2) {
	const unsigned char *p1 = (const unsigned char *)s1;
	const unsigned char *p2 = (const unsigned char *)s2;
	int result;

	if (p1 == p2) {
		return 0;
	}

	if (!p1) {
		return -1;
	}

	if (!p2) {
		return 1;
	}

	while ((result = tolower(*p1) - tolower(*p2++)) == 0) {
		if (*p1++ == '\0') {
			break;
		}
	}

	return result;
}

int strncasecmp(const char *s1, const char *s2, size_t n) {
	const unsigned char *p1 = (const unsigned char *)s1;
	const unsigned char *p2 = (const unsigned char *)s2;
	int result = 0;

	if (p1 == p2) {
		return 0;
	}

	if (!p1) {
		return -1;
	}

	if (!p2) {
		return 1;
	}

	while (n && (result = tolower(*p1) - tolower(*p2++)) == 0) {
		n--;
		if (*p1++ == '\0') {
			break;
		}
	}

	return result;
}
