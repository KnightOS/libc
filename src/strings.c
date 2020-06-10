#include <strings.h>
#include <ctype.h>

int ffs(int i) __naked {
	__asm
	POP IX
	POP HL
		LD B, 8
		LD A, -1
__ffs_loop:
		INC A
		SRA H
		JR C, __ffs_found
		DJNZ __ffs_loop
		LD B, 8
__ffs_loop_2:
		INC A
		SRA L
		JR C, __ffs_found
		DJNZ __ffs_loop_2
		XOR A
__ffs_found:
		LD L, A
	PUSH HL
	PUSH IX
	RET
	__endasm;
	i;
}

int strcasecmp(const char *s1, const char *s2) {
	const unsigned char *p1 = (const unsigned char *)s1;
	const unsigned char *p2 = (const unsigned char *)s2;
	int result;

	if (p1 == p2) {
		return 0;
	}

	if (!p1) {
		return -1;
	}

	if (!p2) {
		return 1;
	}

	while ((result = tolower(*p1) - tolower(*p2++)) == 0) {
		if (*p1++ == '\0') {
			break;
		}
	}

	return result;
}

int strncasecmp(const char *s1, const char *s2, size_t n) {
	const unsigned char *p1 = (const unsigned char *)s1;
	const unsigned char *p2 = (const unsigned char *)s2;
	int result = 0;

	if (p1 == p2) {
		return 0;
	}

	if (!p1) {
		return -1;
	}

	if (!p2) {
		return 1;
	}

	while (n && (result = tolower(*p1) - tolower(*p2++)) == 0) {
		n--;
		if (*p1++ == '\0') {
			break;
		}
	}

	return result;
}

float strtof (unsigned char* str, char** endptr) {
    register unsigned char *ptr = str;
    bool is_neg = false;
    bool overflow = false;
    float result = 0;
    int c;
    float frac_base = 0.1;
    int exponent = 0;
    
    while ( isspace(*ptr) )
        ptr += 1;
    
    if(*ptr == '+') {
        ptr += 1;
    } else if (*ptr == '-'){
        ptr += 1;
        is_neg = true;
    }
    
    // Integer part
    while (1) {
        c = *ptr;
        if (c == '\0' || c < '0' || c > '9') {
            break;
        }
        
        c = c - '0';
        result = result * 10 + c;
        ptr += 1;
    }
    
    // Fractionnal part
    if ( *ptr == '.' ){
        ptr += 1;
        while(1) {
            c = *ptr;
            if (c == '\0' || c < '0' || c > '9') {
                break;
            }
            c = c - '0';
            
            result += frac_base * c;
            frac_base /= 10;
            ptr += 1;
        }
    }
    
    // Exponent part
    if ( *ptr == 'e' ){
        ptr += 1;
        while(1) {
            c = *ptr;
            if (c == '\0' || c < '0' || c > '9') {
                break;
            }
            c = c - '0';
            
            exponent = exponent * 10 + c;
            ptr += 1;
        }
        
        result = result * powf(10, exponent);
    }
    
    if(is_neg)
        result = -result;
    
    if (endptr != 0)
        *endptr = ptr;
    
    return result;
}

int strtoi (unsigned char* str, char** endptr) {
    register unsigned char *ptr = str;
    bool is_neg = false;
    bool overflow = false;
    int result = 0;
    unsigned base = 10;
    
    while ( isspace(*ptr) ) {
        ptr += 1;
    }
    
    if (*ptr == '+') {
        ptr += 1;
    } else if(*ptr == '-') {
        ptr += 1;
        is_neg = true;
    }
    
    if (*ptr == '0' ) {
        base = 8;
        ptr += 1;
        if (*ptr == 'x' ) {
            base = 16;
            ptr += 1;
        }
    }
    
    while (1) {
        int c = *ptr;
        if (c == '\0' || c < '0' || c > '9') {
            break;
        }
        c = c - '0';
        if (result > (INT_MAX/base - c)) {
            overflow = true;
            ptr += 1;
            continue;
        }
        result = result * base + c;
        ptr += 1;
    }
    
    if (endptr != 0)
        *endptr = ptr;
    
    if (is_neg)
        result = -result;
    
    return result;
}
