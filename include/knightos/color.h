#ifndef __COLOR_H
#define __COLOR_H
#include <stdbool.h>
#include <stdint.h>

/**
* Returns true if the current thread is in legacy mode
**/
bool is_legacy();

/**
* Returns true if color is supported
**/
bool color_supported();

/**
* Sets all pixels on the LCD to a specified color in color mode.
**/
void clear_color_lcd(uint16_t *color);

/**
* Draws a clipped rectangle of the specified size with the specified color
**/
void clip_color_rectangle(uint16_t color, char height, short width, short x, char y);

/**
* Turns off the color LCD and backlight
**/
void color_lcd_off();

/**
* Initializes and turns on the color LCD in color mode
**/
void color_lcd_on();

/**
* Sets the clipping window to fit the LCD screen in color mode
**/
void full_screen_window();

/**
* Sets the LCD to legacy mode
**/
void set_legacy_lcd_mode();

/**
* Sets the LCD to color mode. Call before you call system.h/get_lcd_lock()
**/
void reset_legacy_lcd_mode();

/**
* Sets the LCD's clipping window. Values are inclusive
**/
void set_lcd_window(char top_border, char *right_border, char bottom_border, char *left_border);

/**
* Writes a 16-bit value to a color LCD register
**/
void write_lcd_register(char reg, char *value);

/**
* Reads a 16-bit value from a color LCD register
**/
char *read_lcd_register(char reg);

#endif