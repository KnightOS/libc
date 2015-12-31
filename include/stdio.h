#include <stdlib.h>
#include <stdarg.h>

#ifndef __STDIO_H
#define __STDIO_H

/**
* Sends formatted output to a string pointer (*str)
**/
int sprintf(char *str, const char *format, ...);

/**
* Writes formatted output to a character array (*str) up to a maximum amount of characters (size)
**/
int snprintf(char *str, size_t size, const char *format, ...);

/**
* Writes formatted data from a variable arguments list (args) to a character array (*str)
**/
int vsprintf(char *str, const char *format, va_list args);

/**
* Writes formatted data from a variable argument list (args) to a sized buffer (str, size)
**/
int vsnprintf(char *str, size_t size, const char *format, va_list args);

/**
* Same as sprintf but allocates a string large enough to hold the output including the terminating null byte.
**/
int asprintf(char **str, const char *format, ...);

/**
* Same as asprintf but writes formatted data from a variable argument list (args)
**/
int vasprintf(char **str, const char *format, va_list args);
#endif
