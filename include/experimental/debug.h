#ifndef __DEBUG_H
#define __DEBUG_H

#define BREAKPOINT __asm jr $ __endasm;

#include <string.h>
#include <knightos/display.h>

#define __DEBUG_TIMEOUT 100

#define debug_hinted(/* SCREEN* */ screen, msg, /* char* */ hint, /* void(SCREEN*, unsigned char, unsigned char, msg) */ draw_func) \
{ \
    unsigned short i = 0; \
    const unsigned char* bug_msg = hint; \
    const unsigned short bug_msg_len = strlen(bug_msg); \
    const unsigned short space = (bug_msg_len != 0) ? 4 : 0; \
    for(i=0; i<__DEBUG_TIMEOUT;i++){ \
        screen_clear(screen); \
        draw_string(screen, 2, 2, "L. "); \
        draw_short(screen, 2+3*4, 2, __LINE__); \
        draw_string(screen, 2, 8*7, __FILE__); \
        draw_string(screen, 2, 8*1, hint);\
        draw_func(screen, 2+bug_msg_len*4+space, 8*1, msg); \
        draw_short(screen, 2, 8*6, __DEBUG_TIMEOUT-i); \
        screen_draw(screen); \
    } \
}

#define debug(screen, msg, draw_func) debug_hinted(screen, msg, "", draw_func)

#define debug_str(screen, msg) debug(screen, msg, draw_string)
#define debug_short(screen, msg) debug(screen, msg, draw_short)
#define debug_signed(screen, msg) debug(screen, msg, draw_signed)
#define debug_float(screen, msg) debug(screen, msg, draw_float)
#define debug_float_hinted(screen, msg, hint) \
{ \
    float ___temp___ = msg; /* Trick done because of performance issues */ \
    debug_hinted(screen, ___temp___, hint, draw_float); \
}

#endif
