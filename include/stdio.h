#ifndef __STDIO_H
#define __STDIO_H

#include <stdarg.h>
#include <stddef.h>
#include <stdlib.h>
#include <stdbool.h>
static bool put_string(char c, void *data);
int sprintf(char *str, const char *format, ...);
int snprintf(char *str, size_t size, const char *format, ...);
int vsprintf(char *str, const char *format, va_list args);
int vsnprintf(char *str, size_t size, const char *format, va_list args);

#endif