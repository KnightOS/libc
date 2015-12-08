#ifndef __SYSTEM_H
#define __SYSTEM_H

#include <stddef.h>

void get_lcd_lock();
void get_keypad_lock();
void ksleep(unsigned short msecs);
void *malloc(size_t size);
void *realloc(void *ptr, size_t size);
void *calloc(unsigned short nmemb, unsigned short size);
void free(void *ptr);
void load_library(const char *path);
void reboot();
void suspend_device();
unsigned char get_random();

#endif
