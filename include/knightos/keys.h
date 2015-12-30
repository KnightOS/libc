#ifndef __KEYS_H
#define __KEYS_H
/**
* Returns the currently pressed keycode, or zero if no keys are pressed
**/
unsigned char get_key();
/**
* Blocks until a key is pressed, then returns that key code
**/
unsigned char wait_key();
/**
* Blocks until all keys are released
**/
void flush_keys();

#define KEY_DOWN 0x01
#define KEY_LEFT 0x02
#define KEY_RIGHT 0x03
#define KEY_UP 0x04
#define KEY_ENTER 0x09 
#define KEY_ENTRY 0x09 
#define KEY_SOLVE 0x09
#define KEY_PLUS 0x0A 
#define KEY_MEM 0x0A 
#define KEY_QUOTE 0x0A
#define KEY_MINUS 0x0B 
#define KEY_LSQBRACKET 0x0B 
#define KEY_W 0x0B
#define KEY_MUL 0x0C 
#define KEY_RSQBRACKET 0x0C 
#define KEY_R 0x0C
#define KEY_DIV 0x0D 
#define KEY_VARE 0x0D 
#define KEY_M 0x0D
#define KEY_POWER 0x0E 
#define KEY_PI 0x0E 
#define KEY_H 0x0E
#define KEY_CLEAR 0x0F
#define KEY_CHS 0x11 
#define KEY_NEG 0x11 
#define KEY_ANS 0x11 
#define KEY_QUESTION 0x11
#define KEY_3 0x12 
#define KEY_THETA 0x12 
#define KEY_L3 0x12
#define KEY_6 0x13 
#define KEY_L6 0x13 
#define KEY_V 0x13
#define KEY_9 0x14 
#define KEY_VARW 0x14 
#define KEY_Q 0x14
#define KEY_RPAREN 0x15 
#define KEY_RBRACE 0x15 
#define KEY_L 0x15
#define KEY_TAN 0x16 
#define KEY_INVTAN 0x16 
#define KEY_G 0x16
#define KEY_VARS 0x17 
#define KEY_DISTR 0x17
#define KEY_DECPNT 0x19 
#define KEY_DOT 0x19 
#define KEY_PERIOD 0x19 
#define KEY_VARI 0x19 
#define KEY_IMAGINARY 0x19 
#define KEY_COLON 0x19
#define KEY_2 0x1A 
#define KEY_L2 0x1A 
#define KEY_Z 0x1A
#define KEY_5 0x1B 
#define KEY_L5 0x1B 
#define KEY_U 0x1B
#define KEY_8 0x1C 
#define KEY_VARV 0x1C 
#define KEY_P 0x1C
#define KEY_LPAREN 0x1D 
#define KEY_LBRACE 0x1D 
#define KEY_K 0x1D
#define KEY_COS 0x1E 
#define KEY_INVCOS 0x1E 
#define KEY_F 0x1E
#define KEY_PRGM 0x1F 
#define KEY_DRAW 0x1F 
#define KEY_C 0x1F
#define KEY_STAT 0x20 
#define KEY_LIST 0x20
#define KEY_0 0x21 
#define KEY_CATALOG 0x21 
#define KEY_SPACE 0x21
#define KEY_1 0x22 
#define KEY_L1 0x22 
#define KEY_Y 0x22
#define KEY_4 0x23 
#define KEY_L4 0x23 
#define KEY_T 0x23
#define KEY_7 0x24 
#define KEY_VARU 0x24 
#define KEY_O 0x24
#define KEY_COMMA 0x25 
#define KEY_EE 0x25 
#define KEY_J 0x25
#define KEY_SIN 0x26 
#define KEY_INVSIN 0x26 
#define KEY_E 0x26
#define KEY_APPS	 0x27 
#define KEY_ANGLE 0x27 
#define KEY_B 0x27
#define KEY_GRAPHVAR 0x28 
#define KEY_XTTHETAN 0x28 
#define KEY_LINK 0x28
#define KEY_STORE 0x2A 
#define KEY_RCL 0x2A 
#define KEY_X 0x2A
#define KEY_LN 0x2B 
#define KEY_EX 0x2B 
#define KEY_S 0x2B
#define KEY_LOG 0x2C 
#define KEY_10X 0x2C 
#define KEY_N 0x2C
#define KEY_SQUARE 0x2D 
#define KEY_XSQU 0x2D 
#define KEY_SQROOT 0x2D 
#define KEY_I 0x2D
#define KEY_RECIP 0x2E 
#define KEY_XNEG 0x2E 
#define KEY_MATRIX 0x2E 
#define KEY_D 0x2E
#define KEY_MATH 0x2F 
#define KEY_A 0x2F 
#define KEY_TEST 0x2F
#define KEY_ALPHA 0x30 
#define KEY_ALOCK 0x30
#define KEY_GRAPH 0x31 
#define KEY_TABLE 0x31 
#define KEY_F5 0x31
#define KEY_TRACE 0x32 
#define KEY_CALC 0x32 
#define KEY_F4 0x32
#define KEY_ZOOM 0x33 
#define KEY_FORMAT 0x33 
#define KEY_F3 0x33
#define KEY_WINDOW 0x34 
#define KEY_TBLSET 0x34 
#define KEY_TABLESET 0x34 
#define KEY_F2 0x34
#define KEY_YEQU 0x35 
#define KEY_STATPLOT 0x35 
#define KEY_F1 0x35
#define KEY_2ND 0x36
#define KEY_MODE 0x37 
#define KEY_QUITE 0x37
#define KEY_DEL 0x38 
#define KEY_INS 0x38 
#define KEY_DELETE 0x38

#endif
