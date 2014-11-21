#ifndef __DISPLAY_H
#define __DISPLAY_H

typedef unsigned char SCREEN;

void get_lcd_lock();
SCREEN *screen_allocate();
void screen_clear(SCREEN *screen);
void screen_draw(SCREEN *screen);
void draw_string(SCREEN *screen, unsigned char x, unsigned char y, const char *string);
void set_left_margin(unsigned char margin);

#endif
