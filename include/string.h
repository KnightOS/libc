#ifndef __STRING_H
#define __STRING_H

#include <stdlib.h>

/* SDCC built-ins */
#define memcpy(dst, src, n) __builtin_memcpy(dst, src, n)
#define strcpy(dst, src) __builtin_strcpy(dst, src)
#define strncpy(dst, src, n) __builtin_strncpy(dst, src, n)
#define strchr(s, c) __builtin_strchr(s, c)
#define memset(dst, c, n) __builtin_memset(dst, c, n)

/* Other */
size_t strlen(const char *s);
int strcmp(const char *s1, const char *s2);

#endif
