#include <math.h>

//Just a list of factorials, precalculated to save time.
const unsigned int __trig_factlist[] = {
    1, 2, 6, 24, 120, 720, 5040, 40320
};

#define __TWOPI 6.283185307
#define __HALFPI  1.570796327

double sin(double x) {
    double out = 0;
    int iter;

    x = fmod(x,__TWOPI);

    for (iter = 0; iter < 4; iter += 2) {
        out += x / __trig_factlist[iter];
        x = x * x * x;
        out -= x / __trig_factlist[iter+1];
        x = x * x * x;
    }
    return out;
}

double cos(double x) {
    return sin(x - __HALFPI);
}

double tan(double x) {
    return sin(x) / sin(x - __HALFPI);
}

/* Unimplemented
double asin(double x) {
    return x;
}

double acos(double x) {
    return x;
}

double atan(double x) {
    return x;
}

double sinh(double x) {
    return x;
}

double cosh(double x) {
    return x;
}

double tanh(double x) {
    return x;
}
*/
