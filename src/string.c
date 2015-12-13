#include <string.h>
#include <stdint.h>

// SDCC tries to use inline builtins for many of these functions, but will fallback
// to these implementations in some circumstances.

#undef memcpy
void memcpy(void *d, const void *s, size_t n) {
	uint8_t *src = s, *dst = d;
	while (n--) {
		*dst++ = *src++;
	}
}

#undef memset
void memset(void *s, int c, size_t n) {
	uint8_t *src = s;
	while (n--) {
		*src++ = c;
	}
}

#undef strcpy
void strcpy(char *dst, const char *src) {
	while ((*dst++ = *src++));
}

#undef strncpy
void strncpy(char *dst, const char *src, size_t n) {
	while (n && (*dst++ = *src++)) {
		n--;
	}
	while (n--) {
		*dst++ = '\0';
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

char *strrchr(const char *s, int c) {
	char *result = NULL;
	do {
		if (*s == c) {
			result = s;
		}
	} while (*s++);
	return result;
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

size_t strnlen(const char *s, size_t maxlen) {
	size_t l = 0;
	while (maxlen-- && *s++) {
		l++;
	}
	return l;
}

int strcmp(const char *s1, const char *s2) {
	while (*s1 && *s1 == *s2) {
		++s1;
		++s2;
	}
	return (int)*s1 - (int)*s2;
}

int strncmp(const char *s1, const char *s2, size_t n) {
	while (n-- && *s1 && *s1 == *s2) {
		++s1;
		++s2;
	}
	return (int)*s1 - (int)*s2;
}
