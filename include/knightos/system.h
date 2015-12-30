#ifndef __SYSTEM_H
#define __SYSTEM_H

#include <stddef.h>

/**
* Locks the LCD
**/
void get_lcd_lock();

/**
* Locks the keypad
**/
void get_keypad_lock();

/**
* Delays for a number of milliseconds
**/
void ksleep(unsigned short msecs);

/**
* Allocates the specified amount of memory
* Note: errno is set on error
**/
void *malloc(size_t size);

/**
* Reallocates a block of memory at a different size and returns a new pointer
* Note: errno is set on error 
**/
void *realloc(void *ptr, size_t size);

/**
* Locks the LCD
* Note: errno is set on error
**/
void *calloc(unsigned short nmemb, unsigned short size);

/**
* Frees a previously allocated section of memory
**/
void free(void *ptr);

/**
* Loads a library into memory, or references one that may already be loaded
**/
void load_library(const char *path);

/**
* Restarts the device
**/
void reboot();

/**
* Turns of the screen, enters low power mode, and halts system operations until the ON key is pressed
**/
void suspend_device();

/**
* Returns a random 8-bit number (between 0-255)
* Note: this is not cryptographically random.
**/
unsigned char get_random();

#endif
