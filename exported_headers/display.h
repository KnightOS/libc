#ifndef __DISPLAY_H
#define __DISPLAY_H

#include <__libc.h>

#define __LIBC_GET_LCD_LOCK 6

typedef unsigned char SCREEN;

inline void get_lcd_lock() __naked {
	__asm
	__LIBC_CALL(__LIBC_GET_LCD_LOCK)
	__endasm;
}

#endif
