#ifndef __DEBUG_H
#define __DEBUG_H

#define BREAKPOINT __asm jr $ __endasm;

#include <string.h>
#include <knightos/display.h>

#define __DEFAULT_DEBUG_TIMEOUT 150

#define debug_hinted(/* SCREEN* */ screen, msg, /* char* */ hint, /* int */ timeout, /* void(SCREEN*, unsigned char, unsigned char, msg) */ draw_func) \
{ \
    unsigned short i = 0; \
    const unsigned char* bug_msg = hint; \
    const unsigned short bug_msg_len = strlen(bug_msg); \
    const unsigned short space = (bug_msg_len != 0) ? 4 : 0; \
    screen_clear(screen); \
    draw_string(screen, 2, 2, "L. "); \
    draw_short(screen, 2+3*4, 2, __LINE__); \
    draw_string(screen, 2, 8*7, __FILE__); \
    draw_string(screen, 2, 8*1, hint);\
    /* the size of a single character is 4 pixel */ \
    draw_func(screen, 2+bug_msg_len*4+space, 8*1, msg); \
    for(i=0; i<TIMEOUT;i++){ \
        draw_rectangle(screen, 8, 60, 8*6, 0, GFX_AND); \
        draw_short(screen, 2, 8*6, TIMEOUT-i); \
        screen_draw(screen); \
    } \
    screen_clear(screen); \
}

#define debug(screen, msg, draw_func) debug_hinted(screen, msg, "", __DEFAULT_DEBUG_TIMEOUT, draw_func)

#define debug_str(screen, msg) debug_hinted(screen, msg, "str:", __DEFAULT_DEBUG_TIMEOUT, draw_string)
#define debug_short(screen, msg) debug_hinted(screen, msg, "short:", __DEFAULT_DEBUG_TIMEOUT, draw_short)
#define debug_signed(screen, msg) debug_hinted(screen, msg, "signed:", __DEFAULT_DEBUG_TIMEOUT, draw_signed)
#define debug_float(screen, msg) debug_hinted(screen, msg, "float:", __DEFAULT_DEBUG_TIMEOUT, draw_float)
#define debug_float_hinted(screen, msg, hint) debug_hinted(screen, msg, hint, __DEFAULT_DEBUG_TIMEOUT, draw_float)

#endif
