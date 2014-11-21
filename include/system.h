#ifndef __SYSTEM_H
#define __SYSTEM_H

void *malloc(unsigned short size);
void *realloc(void *);
void *calloc(unsigned short nmemb, unsigned short size);
void free(void *);
void load_library(const char *path);

#endif
