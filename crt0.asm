#include <kernel.inc>
.equ libId 0x02
.dw 0x0002
.org 0

jumpTable:
    ; Init
    ret \ nop \ nop
    ; Deinit
    ret \ nop \ nop
    jp _get_lcd_lock
    .db 0xFF
