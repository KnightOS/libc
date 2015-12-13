#include <format.h>
#include <stdbool.h>
#include <stdint.h>
#include <ctype.h>
#include <string.h>

static bool format_char(char c, struct format_data *data) {
	data->count++;
	return data->put(c, data->put_data);
}

static bool format_str(char *str, struct format_data *data) {
	int str_width = strnlen(str, data->precision),
		padding_width = data->field_width- str_width;
	if (padding_width < 0) {
		padding_width = 0;
	}
	if (!data->left) {
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
	char c;
	int inner_width, outer_width;
	inner_width = data->precision - num_width;
	if (inner_width < 0) {
		inner_width = 0;
	}
	outer_width = data->field_width - inner_width - (sign != '\0') - num_width;
	if (outer_width < 0) {
		outer_width = 0;
	}

	if (!data->left) {
		while (outer_width--) {
			if (!format_char(data->pad, data)) {
				return false;
			}
		}
	}

	if (sign) {
		if (!format_char(sign, data)) {
			return false;
		}
	}

	while (inner_width--) {
		if (!format_char('0', data)) {
			return false;
		}
	}

	while (num_width--) {
		c = *num++; c += '0';
		if (c > '9') {
			c += data->hex_offset;
		}
		if (!format_char(c, data)) {
			return false;
		}
	}

	while (outer_width--) {
		if (!format_char(' ', data)) {
			return false;
		}
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

static bool format_long(uint16_t num, uint16_t base, bool is_signed, struct format_data *data) {
	char sign, buffer[32], *ptr = buffer + sizeof buffer;
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

int format(bool (*put)(char, void *), void *put_data, const char *format, va_list args) {
	int count = 0;
	bool more;
	struct format_data data;
	data.put = put;
	data.put_data = put_data;
	data.format = format;
	data.args = args;
	while (*format) {
		if (*format == '%') {
			data.alternate = false;
			data.pad = ' ';
			data.left = false;
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
				data.pad = ' ';
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
					if (!format_int(10, true, &data)) {
						return -1;
					}
					break;
				case 'u':
					if (!format_int(10, false, &data)) {
						return -1;
					}
					break;
				case 'o':
					if (!format_int(8, false, &data)) {
						return -1;
					}
					break;
				case 'x':
					data.hex_offset = 'a' - '0' - 10;
					if (!format_int(16, false, &data)) {
						return -1;
					}
					break;
				case 'X':
					data.hex_offset = 'A' - '0' - 10;
					if (!format_int(16, false, &data)) {
						return -1;
					}
					break;
				case 's':
					if (!format_str(va_arg(data.args, char *), &data)) {
						return -1;
					}
					break;
				case 'n':
					*va_arg(data.args, int *) = data.count;
					break;
				case '%':
					if (!format_char('%', &data)) {
						return -1;
					}
					break;
			}
		} else if (!format_char(*format, &data)) {
			return -1;
		}
		format++;
	}
	return data.count;
}
