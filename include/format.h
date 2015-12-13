#include <stdarg.h>
#include <stdbool.h>
int format(bool (*put)(char, void *), void *put_data, const char *format, va_list args);

struct format_buffer {
	char *start, *end;
};

struct format_data {
	bool (*put)(char, void *);
	void *put_data;
	const char *format;
	va_list args;
	int count;
	bool alternate, left;
	char sign, pad, hex_offset;
	int field_width, precision;
	enum {
		FORMAT_CHAR, FORMAT_SHORT, FORMAT_INT, FORMAT_LONG
	} length;
};
