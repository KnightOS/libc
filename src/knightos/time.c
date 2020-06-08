#include <knightos/time.h>

bool clockSupported() __naked {
    __asm
    ld iy,#2
    add iy, sp
    
    PCALL(CLOCKSUPPORTED)
    
    jr nz, unsupported
supported:
    ld l, #1
unsupported:
    ld l, #0
    ret
    __endasm;
}

short getTimeInTicks() __naked {
    __asm
    ld iy,#2
    add iy,sp

    
    PCALL(GETTIMEINTICKS)
    
    ret
    __endasm;
}
