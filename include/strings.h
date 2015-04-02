#ifndef __STRINGS_H
#define __STRINGS_H

//#include <locale.h>
#include <sys/types.h>

int ffs(int);
int strcasecmp(const char *, const char *);
//int strcasecmp_l(const char *, const char *, locale_t);
int strncasecmp(const char *, const char *, size_t);
//int strncasecmp_l(const char *, const char *, size_t, locale_t);

#endif
