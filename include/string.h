#ifndef __STRING_H
#define __STRING_H

#include <stdlib.h>

/* SDCC built-ins */
/**
* Copies n bytes from memory area `src` to memory area `dst`
**/
#define memcpy(dst, src, n) __builtin_memcpy(dst, src, n)

/**
* Copies `src`, including the null terminator, to `dst`
**/
#define strcpy(dst, src) __builtin_strcpy(dst, src)

/**
* Same as strcpy, but at most n bytes are copied
**/
#define strncpy(dst, src, n) __builtin_strncpy(dst, src, n)

/**
* Returns a pointer to the first occurence of `c` in string `s`
**/
#define strchr(s, c) __builtin_strchr(s, c)

/**
* Fills the first n bytes of the string `dst` with the constant byte `c`
**/
#define memset(dst, c, n) __builtin_memset(dst, c, n)

/**
* Returns a pointer to the first occurence of `c` in string `s`
**/
char *strrchr(const char *s, int c);

/**
* Concatenates two strings
**/
char *strcat(char *dst, char *src);

/* Other */

/**
* Copies `n` bytes from s2 to s1
**/
void *memmove(void *s1, const void *s2, size_t n);

/**
* Returns the length of a string
**/
size_t strlen(const char *s);

/**
* Returns the length of a string up to `maxlen` 
**/
size_t strnlen(const char *s, size_t maxlen);

/**
* Compares two strings. If the return is less then 0, the first character that does not match has a lower value in s1 than s2. 
* If the return is 0, the strings are equal.
* If the return is greater then 0, the first character that does not match has a greater value in s1 than in s2
**/
int strcmp(const char *s1, const char *s2);

/**
* Same as strcmp but only compares the first `n` characters
**/ 
int strncmp(const char *s1, const char *s2, size_t n);

#endif
