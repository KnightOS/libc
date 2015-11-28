#ifndef __CTYPE_H
#define __CTYPE_H

// TODO: The rest of this header
int tolower(int);
int isspace(int);
int isdigit(int c);
int isalpha(int c);
int isalnum(int c);
int isupper(int c);
int islower(int c);
int toascii(int c);

#define _toupper(i) toupper(i)
#define _tolower(i) tolower(i)

#endif
