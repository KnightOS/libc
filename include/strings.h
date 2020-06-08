#ifndef __STRINGS_H
#define __STRINGS_H

#include <sys/types.h>

/**
* Returns the position of the first (least significant) bit
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

/**
 * Mostly ANSI compliant strtof function - converts a string into a float, ignoring blanks at the begining
**/
float strtof (unsigned char* str, char** endptr);

/**
 * Mostly ANSI compliant strtoi function - converts a string into an int, ignoring blanks at the begining
 * Does not yet support non decimal bases
**/
int strtoi (unsigned char* str, char** endptr);

#endif
