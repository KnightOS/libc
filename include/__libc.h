#ifndef __LIBC_H
#define __LIBC_H

#define __LIBC_ID 0xC0

#define __LIBC_CALL(ADDRESS) \
    RST 0x10 \ \
    .db __LIBC_ID \ \
    .db 0xCD \ \
    .dw ADDRESS \

#define __LIBC_GET_LCD_LOCK 6
#define __LIBC_SCREEN_ALLOCATE 9
#define __LIBC_SCREEN_CLEAR 12
#define __LIBC_SCREEN_DRAW 15
#define __LIBC_DRAW_STRING 18

#endif
