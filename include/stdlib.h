#ifndef __STDLIB_H
#define __STDLIB_H

#include <stddef.h>

void *malloc(size_t size);
void *realloc(void *ptr, size_t size);
void *calloc(size_t nmemb, size_t size);
void free(void *ptr);
/* Note: exit is provided by the crt0 */
void exit(int c);

#endif
