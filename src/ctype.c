#include <ctype.h>
#include <string.h>

int tolower(int c) {
	if ('A' <= c && c <= 'Z') {
		return c - ('a' - 'A');
	}
	return c;
}

int isspace(int c) {
	if (c == ' ' || c == '\t') {
		return 1;
	}
	return 0;
}

int isdigit(int c) {
	if (strchr("0123456789", c)) {
		return 1;
	}
	return 0;
}
