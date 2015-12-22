#include <stdlib.h>
#include <stdarg.h>

#ifndef __STDIO_H
#define __STDIO_H

int sprintf(char *str, const char *format, ...);
int snprintf(char *str, size_t size, const char *format, ...);
int vsprintf(char *str, const char *format, va_list args);
int vsnprintf(char *str, size_t size, const char *format, va_list args);
int asprintf(char **strp, const char *fmt, ...);
int vasprintf(char **strp, const char *fmt, va_list ap);
#endif
