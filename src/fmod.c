#include <math.h>

double fmod(double x, double div) {
    while(x > div) {
        x -= div;
    }
    return x;
}
