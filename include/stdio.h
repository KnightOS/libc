#include <stdarg.h>
#include <stdbool.h>
#include <stdint.h>
#include <ctype.h>

int snprintf(char *str, size_t size, const char *format, ...);
int sprintf(char *str, const char *format, ...);
int vsnprintf(char *str, size_t size, const char *format, va_list args);
int vsprintf(char *str, const char *format, va_list args);