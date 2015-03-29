#ifndef __SYSTEM_H
#define __SYSTEM_H

void get_lcd_lock();
void get_keypad_lock();
void *malloc(unsigned short size);
void *realloc(void *);
void *calloc(unsigned short nmemb, unsigned short size);
void free(void *);
void load_library(const char *path);

#endif
