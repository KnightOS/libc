#include <stdarg.h>

int format(bool (*put)(char, void *), void *put_data, const char *format, va_list args);
