#include <stdarg.h>
#include <stdbool.h>
#include <stdint.h>
#include <ctype.h>

int vsnprintf(char *str, size_t size, const char *format, va_list args) {
	int count;
	struct format_buffer buffer;
	if (!size) {
		return 0;
	}
	buffer.start = str;
	buffer.end = str + size - 1;
	count = format(put_string, &buffer, format, args);
	*buffer.start = '\0';
	return count;
}

int snprintf(char *str, size_t size, const char *format, ...) {
	va_list args;
	int count;
	va_start(args, format);
	count = vsnprintf(str, size, format, args);
	va_end(args);
	return count;
}

int vsprintf(char *str, const char *format, va_list args) {
	int count;
	struct format_buffer buffer;
	if (!size) {
		return 0;
	}
	buffer.start = str;
	buffer.end = 0; // if we get here, might as well stop
	count = format(put_string, &buffer, format, args);
	*buffer.start = '\0';
	return count;
}

int sprintf(char *str, const char *format, ...) {
	va_list args;
	int count;
	va_start(args, format);
	count = vsnprintf(str, size, format, args);
	va_end(args);
	return count;
}
