#include "kernel.inc"

.equ libId 0xC0

.dw 0xC0

.org 0

jumpTable:
    ; Init
    ret \ nop \ nop
    ; Deinit
    ret \ nop \ nop
    jp _get_lcd_lock
    jp _screen_allocate
    jp _screen_clear
    jp _screen_draw
    jp _draw_string
    .db 0xFF

; void get_lcd_lock()
_get_lcd_lock:
    pcall(getLcdLock)
    ret

; SCREEN *screen_allocate()
_screen_allocate:
    pcall(allocScreenBuffer)
    push iy \ pop hl
    ret

; void screen_clear(SCREEN *screen)
_screen_clear:
    pop bc
    pop iy
        pcall(clearBuffer)
    push iy
    push bc
    ret

; void screen_draw(SCREEN *screen)
_screen_draw:
    pop bc
    pop iy
        pcall(fastCopy)
    push iy
    push bc
    ret

; void draw_str(SCREEN *screen, unsigned char x, unsigned char y, const char *string)
_draw_string:
    pop ix
    pop iy ; screen
    pop de ; y, x
    pop hl ; string
        ; Reverse DE so that it's x,y instead of y, x
		ld a, d
		ld d, e
		ld e, a
        pcall(drawStr)
    push hl
    push de
    push iy
    push ix
    ret
