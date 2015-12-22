#include <stdio.h>
#include <format.h>
#include <stddef.h>
#include <stdlib.h>

struct format_buffer {
	char *start, *end;
};

static bool format_put_string(char c, void *data) {
	struct format_buffer *buffer = data;
	if (buffer->start != buffer->end) {
		*buffer->start++ = c;
	}
	return true;
}

int vsnprintf(char *str, size_t size, const char *format, va_list args) {
	int count;
	struct format_buffer buffer;
	if (!size) {
		return 0;
	}
	buffer.start = str;
	buffer.end = str + size - 1;
	count = format_callback(format_put_string, &buffer, format, args);
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
	buffer.start = str;
	buffer.end = 0;
	count = format_callback(format_put_string, &buffer, format, args);
	*buffer.start = '\0';
	return count;
}

int sprintf(char *str, const char *format, ...) {
	va_list args;
	int count;
	va_start(args, format);
	count = vsprintf(str, format, args);
	va_end(args);
	return count;
}

int asprintf(char **str, const char *format, ...) {
	va_list args;
	int count;
	va_start(args, format);
	count = vasprintf(str, format, args);
	va_end(args);
	return count;
}

int vasprintf(char **str, const char *format, va_list args) {
	char *buffer, *new_buffer;
	size_t length;
	int count;
	va_list args2;

	length = 128;
	buffer = malloc(length);
	if (buffer == NULL) {
		count = NULL;
		return -1;
	}
	va_copy(args2, args);
	count = vsnprintf(buffer, length, format, args);
	if (count < 0) {
		free(buffer);
		*str = NULL;
		va_end(args2);
		return -1;
	}

	if (count < length) {
		new_buffer = realloc(buffer, count + 1);
		if (new_buffer == NULL)
			*str = buffer;
		else
			*str = new_buffer;
		va_end(args2);
		return count;
	}

	length = (size_t)count + 1;
	free(buffer);
	buffer = malloc(length);
	if (buffer == NULL) {
		*str = NULL;
		va_end(args2);
		return -1;
	}

	count = vsnprintf(buffer, length, format, args2);
	va_end(args2);
	if (count != length - 1) {
		free(buffer);
		*str = NULL;
		return -1;
	}

	*str = buffer;
	return count;
}