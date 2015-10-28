#ifndef __MATH_H
#define __MATH_H
/* Provides most of the standard C math.h routines */

// define some constants
#define M_E              2.718281828    /* e */
#define M_LOG2E	         1.442695040    /* log_2 e */
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


#endif
