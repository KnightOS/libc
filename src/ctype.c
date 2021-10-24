#include <ctype.h>
#include <string.h>

int
tolower(int c)
{
	if(isupper(c))
		return c + ('a' - 'A');
	return c;
}

int
toupper(int c)
{
	if(islower(c))
		return c + ('A' - 'a');
	return c;
}

int
isspace(int c)
{
	if(c == ' ' || c == '\t')
		return 1;
	return 0;
}

int
islower(int c)
{
	return c >= 'a' && c <= 'z';
}

int
isupper(int c)
{
	return c >= 'A' && c <= 'Z';
}

int
isdigit(int c)
{
	return c >= '0' && c <= '9';
}

int
isalpha(int c)
{
	return islower(c) || isupper(c);
}

int
isalnum(int c)
{
	return isdigit(c) || isalpha(c);
}

int
toascii(int c)
{
	return c & 0x7F;
}

