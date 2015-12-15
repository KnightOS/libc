#include <stdarg.h>
#include <stdbool.h>

int format_callback(bool (*put)(char, void *), void *put_data, const char *format, va_list args);
