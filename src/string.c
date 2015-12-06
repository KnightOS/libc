#include <string.h>
#include <stdint.h>

// SDCC tries to use inline builtins for many of these functions, but will fallback
// to these implementations in some circumstances.

#undef memcpy
void memcpy(void *_dest, const void *_src, size_t n) {
	uint8_t *src = _src, *dest = _dest;
	while (n--) {
		*src = *dest;
	}
}

#undef memset
void memset(void *s, int c, size_t n) {
	uint8_t *src = s;
	while (n--) {
		*src = c;
	}
}

#undef strcpy
void strcpy(char *dst, const char *src) {
	while (*src) {
		*dst = *src++;
	}
}

#undef strncpy
void strncpy(char *dst, const char *src, size_t n) {
	while (*src && n--) {
		*dst = *src++;
	}
}

#undef strchr
char *strchr(const char *s, int c) {
	do {
		if (*s == c) {
			return s;
		}
	} while (*s++);
	return NULL;
}

void *memmove(void *s1, const void *s2, size_t n) {
    char *dest = (char *)s1;
    const char *src = (const char *)s2;
    if (dest <= src) {
        while (n--) {
            *dest++ = *src++;
        }
    } else {
        src += n;
        dest += n;
        while (n--) {
            *--dest = *--src;
        }
    }
    return s1;
}

size_t strlen(const char *s) {
	size_t l = 0;
	while (*s++) {
		l++;
	}
	return l;
}

int strcmp(const char *s1, const char *s2) {
	while ((*s1) && (*s1 == *s2)) {
		++s1;
		++s2;
	}
	return (*(unsigned char *)s1 - *(unsigned char *)s2);
}
