#ifndef __DISPLAY_H
#define __DISPLAY_H

#define DISPLAY_WIDTH 96
#define DISPLAY_HEIGHT 64

typedef unsigned char SCREEN;

typedef enum {
    GFX_OR,
    GFX_XOR,
    GFX_AND
} GFX_BLEND_MODE;

SCREEN *screen_allocate();
void screen_clear(SCREEN *screen);
void screen_draw(SCREEN *screen);
void draw_string(SCREEN *screen, unsigned char x, unsigned char y, const char *string);
void draw_line(SCREEN *screen, unsigned char x1, unsigned char y1, unsigned char x2, unsigned char y2);
void draw_v_line(SCREEN *screen, unsigned char x, unsigned char y, unsigned char height);
void draw_sprite(SCREEN *screen, unsigned char x, unsigned char y, unsigned char height, const void *sprite, GFX_BLEND_MODE blend_mode);
void draw_sprite_and(SCREEN *screen, unsigned char x, unsigned char y, unsigned char height, const void *sprite);
void draw_sprite_or(SCREEN *screen, unsigned char x, unsigned char y, unsigned char height, const void *sprite);
void draw_sprite_xor(SCREEN *screen, unsigned char x, unsigned char y, unsigned char height, const void *sprite);
void draw_rect_and(SCREEN *screen, unsigned char width, unsigned char height, unsigned char x, unsigned char y);
void draw_char(SCREEN *screen, unsigned char x, unsigned char y, unsigned char value);
void draw_short(SCREEN *screen, unsigned char x, unsigned char y, unsigned short value);
void set_pixel(SCREEN *screen, unsigned char x, unsigned char y);
void set_left_margin(unsigned char margin);
#endif
