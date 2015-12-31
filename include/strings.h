#ifndef __STRINGS_H
#define __STRINGS_H

#include <sys/types.h>

/**
* Returns the position of the first (least signifigant) bit
**/
int ffs(int);

/**
* Performs byte-by-byte comparison of the two input strings ignoring the case of the characters. 
**/
int strcasecmp(const char *, const char *);
//int strcasecmp_l(const char *, const char *, locale_t);

/**
* Performs byte-by-byte comparison of the two input strings ignoring the case of the characters up to `n` characters.
**/
int strncasecmp(const char *, const char *, size_t);
//int strncasecmp_l(const char *, const char *, size_t, locale_t);

#endif
