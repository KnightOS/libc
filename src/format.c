#include <stdarg.h>
#include <stdbool.h>
#include <stdint.h>
#include <ctype.h>

struct format_data {
	bool (*put)(char, void *);
	void *put_data;
	const char *format;
	va_list args;
	int count;
	bool alternate, left;
	char sign, pad;
	int field_width, precision;
	enum {
		FORMAT_CHAR, FORMAT_SHORT, FORMAT_INT, FORMAT_LONG
	} length;
};

static bool format_char(char c, struct format_data *data) {
	if (!data->put(c, data->put_data)) {
		return false;
	}
	data->count++;
	return true;
}

static bool format_str(char *str, struct format_data *data) {
	int str_width = strnlen(str, data->precision),
		padding_width = data->field_width - str_width;
	if (padding_width < 0) {
		padding_width = 0;
	}
	if (!data->left_adjusted) {
		while (padding_width--) {
			if (!format_char(' ', data)) {
				return false;
			}
		}
	}
	while (str_width--) {
		if (!format_char(*str++, data)) {
			return false;
		}
	}
	while (padding_width--) {
		if (!format_char(' ', data)) {
			return false;
		}
	}
	return true;
}

static bool format_num(char sign, char *num, int num_width, struct format_data *data) {
	int inner_width, outer_width;
	inner_width = data->precision - num_width;
	if (inner_width < 0) {
		inner_width = 0
	}
	outer_width = data->field_width - inner_width - (sign != '\0') - num_width;
	if (outer_width < 0) {
		outer_width = 0;
	}

	if (!modifiers->left_adjusted) {
		while (outer_width) {
			if (!format_char(pad, data)) {
				return false;
			}
			outer_width--;
		}
	}

	if (sign) {
		if (!format_char('-', data)) {
			return false;
		}
	}

	while (inner_width) {
		if (!format_char('0', data)) {
			return false;
		}
		inner_width--;
	}

	while (size) {
		c = *p + '0';
		if (c > '9') {
			c += 'A' - '9' - 1;
		}
		if (!format_char(c, data)) {
			return false;
		}
		c++;
		size--;
	}

	while (outer_width) {
		if (!format_char(pad, data)) {
			return false;
		}
		outer_width--;
	}

	return true;
}

static bool format_byte(uint8_t num, uint8_t base, bool is_signed, struct format_data *data) {
	char sign, buffer[8], *ptr = buffer + sizeof buffer;
	if (is_signed) {
		if ((int8_t)num < 0) {
			num = -num;
			sign = '-';
		} else {
			sign = data->sign;
		}
	} else {
		sign = '\0';
	}
	do {
		*--ptr = num % base;
	} while (num /= base);
	return format_num(sign, ptr, buffer + sizeof buffer - ptr, data);
}

static bool format_short(uint16_t num, uint16_t base, bool is_signed, struct format_data *data) {
	char sign, buffer[16], *ptr = buffer + sizeof buffer;
	if (is_signed) {
		if ((int16_t)num < 0) {
			num = -num;
			sign = '-';
		} else {
			sign = data->sign;
		}
	} else {
		sign = '\0';
	}
	do {
		*--ptr = num % base;
	} while (num /= base);
	return format_num(sign, ptr, buffer + sizeof buffer - ptr, data);
}

static bool format_long(uint32_t num, uint32_t base, bool is_signed, struct format_data *data) {
	char sign, buffer[32], *ptr = buffer + sizeof buffer;
	if (is_signed) {
		if ((int32_t)num < 0) {
			num = -num;
			sign = '-';
		} else {
			sign = data->sign;
		}
	} else {
		sign = '\0';
	}
	do {
		*--ptr = num % base;
	} while (num /= base);
	return format_num(sign, ptr, buffer + sizeof buffer - ptr, data);
}

static bool format_int(int base, bool is_signed, struct format_data *data) {
	switch (data->length) {
		case FORMAT_CHAR:
			return format_byte(va_arg(data->args, uint8_t), base, is_signed, data);
		case FORMAT_SHORT:
		case FORMAT_INT:
			return format_short(va_arg(data->args, uint16_t), base, is_signed, data);
		case FORMAT_LONG:
			return format_long(va_arg(data->args, uint16_t), base, is_signed, data);
	}
	return false;
}

int format(bool (*put)(char, void *), void *data, const char *format, va_list args) {
	int count = 0;
	bool more;
	struct format_data data;
	data.put = put;
	data.put_data = data;
	data.format = format;
	data.args = args;
	while (*format) {
		if (*format == '%') {
			data.alternate = data.zero_padded = data.left_adjusted = false;
			data.pad = ' ';
			data.sign = '\0';
			more = true;
			do {
				switch (*++format) {
					case '#':
						data.alternate = true;
						break;
					case '0':
						data.pad = '0';
						break;
					case '-':
						data.left = true;
						break;
					case ' ':
						data.sign = ' ';
						break;
					case '+':
						data.sign = '+';
						break;
					default:
						more = false;
						break;
				}
			} while (more);
			if (isdigit(*format)) {
				data.field_width = *format - '0';
				while (isdigit(*++format)) {
					data.field_width *= 10;
					data.field_width += *format - '0';
				}
			} else {
				data.field_width = -1;
			}
			if (*format == '.') {
				if (isdigit(*++format)) {
					data.precision = *format - '0';
					while (isdigit(*++format)) {
						data.precision *= 10;
						data.precision += *format - '0';
					}
				} else if (*format == '-') {
					while (isdigit(*++format));
					data.precision = -1;
				} else {
					data.precision = 0;
				}
			} else {
				data.precision = -1;
			}
			switch (*format) {
				case 'h':
					if (format[1] == 'h') {
						format += 2;
						data.length = FORMAT_CHAR;
						break;
					}
				case 'z':
				case 't':
					format++;
					data.length = FORMAT_SHORT;
					break;
				default:
					data.length = FORMAT_INT;
					break;
				case 'l':
					if (format[1] == 'l') {
						format++;
					}
				case 'L':
				case 'j':
					format++;
					data.length = FORMAT_LONG;
					break;
			}
			switch (*format) {
				case 'd':
				case 'i':
					if (!format_num(10, true, data)) {
						return false;
					}
					more = false;
					break;
				case 'u':
					if (!format_num(10, false, data)) {
						return false;
					}
					more = false;
					break;
				case 'o':
					if (!format_num(8, false, data)) {
						return false;
					}
					more = false;
					break;
				case 'x':
					if (!format_num(16, false, data)) {
						return false;
					}
					more = false;
					break;
				case 's':
					if (!format_str(va_arg(data.args, char *), data)) {
						return false;
					}
					break;
				case 'n':
					*va_arg(data.args, int *) = data.count;
					break;
				case '%':
					if (!format_char('%', data)) {
						return data.count;
					}
					break;
				}
			}
		} else {
			format_char(*format);
		}
		format++;
	}
	return data.count;
}

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