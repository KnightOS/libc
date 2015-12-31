#ifndef __CTYPE_H
#define __CTYPE_H

// TODO: The rest of this header
/**
* Converts uppercase letters to lower-case
**/
int tolower(int);

/**
* Checks whether the passed character is white-space
**/
int isspace(int);

/**
* Checks whether the passed character is a decimal digit
**/
int isdigit(int c);

/**
* Checks whether the passed character is alphabetic
**/
int isalpha(int c);

/**
* Checks whether the passed character is alphanumeric
**/
int isalnum(int c);

/**
* Checks whether the passed character is upper-case
**/
int isupper(int c);

/**
* Checks whether the passed character is lower-case
**/
int islower(int c);

/**
* Converts c into a 7-bit ASCII character
**/
int toascii(int c);

#define _toupper(i) toupper(i)
#define _tolower(i) tolower(i)

#endif
