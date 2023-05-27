#ifndef __MATH_H
#define __MATH_H

// define some constants
#define M_E              2.718281828    /* e */
#define M_LOG2E	       1.442695040    /* log_2 e */
#define M_LOG10E         0.434294481    /* log_10 e */
#define M_LN2            0.693147180    /* log_e 2 */
#define M_LN10           2.302585092    /* log_e 10 */
#define M_2PI            6.283185307    /* 2*pi */
#define M_PI             3.141592653	/* pi */
#define M_PI_2           1.570796326	/* pi/2 */
#define M_PI_4           0.785398163	/* pi/4 */
#define M_1_PI           0.318309886	/* 1/pi */
#define M_2_PI           0.636619772	/* 2/pi */
#define M_2_SQRTPI       1.128379167	/* 2/sqrt(pi) */
#define M_SQRT2          1.414213562	/* sqrt(2) */
#define M_SQRT1_2        0.707106781	/* 1/sqrt(2) */
#define NAN              0x7FC00000

int abs(int);
double fabs(double);
double fmod(double,double);

double sin(double);
double cos(double);
double tan(double);
double asin(double);
double acos(double);
double atan(double);
double sinh(double);
double cosh(double);
double tanh(double);

double pow(double x, double y);
float powf(float x, float y);


#endif

// SDCC header follows

/*-------------------------------------------------------------------------
   math.h: Floating point math function declarations

   Copyright (C) 2001, Jesus Calvino-Fraga, jesusc@ieee.org

   This library is free software; you can redistribute it and/or modify it
   under the terms of the GNU General Public License as published by the
   Free Software Foundation; either version 2, or (at your option) any
   later version.

   This library is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this library; see the file COPYING. If not, write to the
   Free Software Foundation, 51 Franklin Street, Fifth Floor, Boston,
   MA 02110-1301, USA.

   As a special exception, if you link this library with other files,
   some of which are compiled with SDCC, to produce an executable,
   this library does not by itself cause the resulting executable to
   be covered by the GNU General Public License. This exception does
   not however invalidate any other reasons why the executable file
   might be covered by the GNU General Public License.
-------------------------------------------------------------------------*/

/* Version 1.0 - Initial release */

#ifndef _INC_MATH
#define _INC_MATH

#define HUGE_VALF   3.402823466e+38

#define PI          3.1415926536
#define TWO_PI      6.2831853071
#define HALF_PI     1.5707963268
#define QUART_PI    0.7853981634
#define iPI         0.3183098862
#define iTWO_PI     0.1591549431
#define TWO_O_PI    0.6366197724

/* EPS=B**(-t/2), where B is the radix of the floating-point representation
   and there are t base-B digits in the significand.  Therefore, for floats
   EPS=2**(-12).  Also define EPS2=EPS*EPS. */
#define EPS 244.14062E-6
#define EPS2 59.6046E-9

union float_long
{
    float f;
    long l;
};

/**********************************************
 * Prototypes for float ANSI C math functions *
 **********************************************/

/* Trigonometric functions */
float sinf(float x);
float cosf(float x);
float tanf(float x);
float cotf(float x);
float asinf(float x);
float acosf(float x);
float atanf(float x);
float atan2f(float x, float y);

/* Hyperbolic functions */
float sinhf(float x);
float coshf(float x);
float tanhf(float x);

/* Exponential, logarithmic and power functions */
float expf(float x);
float logf(float x);
float log10f(float x);
float powf(float x, float y);
float sqrtf(float a);

/* Nearest integer, absolute value, and remainder functions */
float fabsf(float x);
float frexpf(float x, int *pw2);
float ldexpf(float x, int pw2);
float ceilf(float x);
float floorf(float x);
float modff(float x, float * y);

/* Non-standard functions */

/* Doing decimal logarithm this way for unsigned integers is actually faster than it may look, and even allows for compile-time evaluation on constants. */
inline unsigned log10u(unsigned x) {
    return ((x >= 1000000000u) ? 9 : (x >= 100000000u) ? 8 : \
        (x >= 10000000u) ? 7 : (x >= 1000000u) ? 6 : \
        (x >= 100000u) ? 5 : (x >= 10000u) ? 4 : \
        (x >= 1000u) ? 3 : (x >= 100u) ? 2 : (x >= 10u) ? 1u : 0u);
}

#endif  /* _INC_MATH */
