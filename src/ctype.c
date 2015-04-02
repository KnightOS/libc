#include <ctype.h>

int tolower(int c) {
	if ('A' <= c && c <= 'Z') {
		return c - ('a' - 'A');
	}
	return c;
}
