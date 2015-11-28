#include <ctype.h>
#include <string.h>

int tolower(int c) {
	if ('A' <= c && c <= 'Z') {
		return c - ('a' - 'A');
	}
	return c;
}

int toupper(int c) {
	if ('a' <= c && c <= 'z') {
		return c - ('A' - 'a');
	}
	return c;
}

int isspace(int c) {
	if (c == ' ' || c == '\t') {
		return 1;
	}
	return 0;
}

int islower(int c) {
	return c >= 'a' && c <= 'z';
}

int isupper(int c) {
	return c >= 'A' && c <= 'Z';
}

int toascii(int c) {
	return c;
}

int isdigit(int c) {
	return c >= '0' && c <= '9';
}

int isalpha(int c) {
	return (c >= 'a' && c <= 'z') || (c >= 'A' || c <= 'Z');
}

int isalnum(int c) {
	return isdigit(c) || isalpha(c);
}
