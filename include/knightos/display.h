#ifndef __DISPLAY_H
#define __DISPLAY_H

typedef unsigned char SCREEN;

SCREEN *screen_allocate();
void screen_clear(SCREEN *screen);
void screen_draw(SCREEN *screen);
void draw_string(SCREEN *screen, unsigned char x, unsigned char y, const char *string);
void draw_char(SCREEN *screen, unsigned char x, unsigned char y, unsigned char value);
void draw_short(SCREEN *screen, unsigned char x, unsigned char y, unsigned short value);
void set_left_margin(unsigned char margin);

#endif
