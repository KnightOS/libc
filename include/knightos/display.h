#ifndef __DISPLAY_H
#define __DISPLAY_H

#define DISPLAY_WIDTH 96
#define DISPLAY_HEIGHT 64

typedef unsigned char SCREEN;
/**
* Blend mode enum used for draw_sprite
**/
typedef enum {
    GFX_OR,
    GFX_XOR,
    GFX_AND
} GFX_BLEND_MODE;

SCREEN *screen_allocate();

/**
* Clears the screen buffer
**/
void screen_clear(SCREEN *screen);

/**
* Copies the screen buffer to the LCD
**/
void screen_draw(SCREEN *screen);

/**
* Draws a string (char *)
**/
void draw_string(SCREEN *screen, unsigned char x, unsigned char y, const char *string);

/**
* Draws a line from x1, y1 to x2, y2
**/
void draw_line(SCREEN *screen, unsigned char x1, unsigned char y1, unsigned char x2, unsigned char y2);

/**
* Draws a vertical line
* Note: uses draw_line, not the kernel-provided drawVLine
**/
void draw_v_line(SCREEN *screen, unsigned char x, unsigned char y, unsigned char height);

/**
* Draws sprite using given GFX_BLEND_MODE
**/
void draw_sprite(SCREEN *screen, unsigned char x, unsigned char y, unsigned char height, const void *sprite, GFX_BLEND_MODE blend_mode);

/**
* Draws sprite using AND logic (turn pixels off)
**/
void draw_sprite_and(SCREEN *screen, unsigned char x, unsigned char y, unsigned char height, const void *sprite);

/**
* Draws sprite using OR logic (turn pixels on)
**/
void draw_sprite_or(SCREEN *screen, unsigned char x, unsigned char y, unsigned char height, const void *sprite);

/**
* Draws sprite using XOR logic (invert pixels)
**/
void draw_sprite_xor(SCREEN *screen, unsigned char x, unsigned char y, unsigned char height, const void *sprite);

/** 
* Draws a rectangle using given GFX_BLEND_MODE
**/
void draw_rectangle(SCREEN *screen, unsigned char width, unsigned char height, unsigned char x, unsigned char y, GFX_BLEND_MODE blend_mode);

/**
* Draws a rectangle using OR logic (turn pixels on)
**/
void draw_rect_or(SCREEN *screen, unsigned char width, unsigned char height, unsigned char x, unsigned char y);

/**
* Draws a rectangle using AND logic (turn pixels off)
**/
void draw_rect_and(SCREEN *screen, unsigned char width, unsigned char height, unsigned char x, unsigned char y);

/**
* Draws a rectangle using XOR logic (invert pixels)
**/
void draw_rect_xor(SCREEN *screen, unsigned char width, unsigned char height, unsigned char x, unsigned char y);

/**
* Draws a character at x, y
**/
void draw_char(SCREEN *screen, unsigned char x, unsigned char y, unsigned char value);

/**
* Draws a short at x, y
**/
void draw_short(SCREEN *screen, unsigned char x, unsigned char y, unsigned short value);

/**
* Draws a byte at x, y
**/
void draw_byte(SCREEN *screen, unsigned char x, unsigned char y, unsigned char value);

/**
 * Draws a signed short at x, y
**/
void draw_signed(SCREEN *screen, unsigned char x, unsigned char y, signed short value);

/**
 * Draws a float at x,y
**/

void draw_float(SCREEN* screen, unsigned char x, unsigned char y, float value);

/**
* Draws a long at x, y
* NYI
**/
void draw_long(SCREEN *screen, unsigned char x, unsigned char y, unsigned long value);

/**
* Set the left-margin for draw_string
**/
void set_left_margin(unsigned char margin);

/**
* Inverts a pixel on the screen buffer
**/
void invert_pixel(SCREEN *screen, char x, char y);

/**
* Resets a pixel on the screen buffer
**/
void reset_pixel(SCREEN *screen, char x, char y);

/**
* Sets a pixel on the screen buffer
**/
void set_pixel(SCREEN *screen, char x, char y);
#endif
