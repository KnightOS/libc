#include <math.h>

// A list of factorials, precalculated to save time.
const unsigned int __trig_factlist[] = {
    1, 1, 2, 6, 24, 120, 720, 5040, 40320
};

double sin(double x) {
	double x_pow = x;
	double out = 0;
	int sign = 1;
	int i;

	x = fmod(x, M_2PI);
	// calculate reference angle, get sign
	if (x > 3 * M_PI / 2) {
		x = M_2PI - x;
		sign = -1;
	} else if (x > M_PI) {
		x = x - M_PI;
		sign = -1;
	} else if (x > M_PI_2) {
		x = M_PI - x;
	}
	// if x > 45, use cos(90-x)
	if (x > M_PI_4) {
		return sign * cos(M_PI_2 - x);
	}
	// calculate sin x using taylor series
	for (i = 1; i < 8; i += 4) {
		out += x_pow / __trig_factlist[i];
		x_pow *= x * x;
		out -= x_pow / __trig_factlist[i + 2];
		x_pow *= x * x;
	}

	return sign * out;
}

double cos(double x) {
	double x_pow = 1;
	double out = 0;
	int sign = 1;
	int i;

	// similar algorithm as sin(x)
	x = fmod(x, M_2PI);
	if (x > 3 * M_PI / 2) {
		x = M_2PI - x;
	} else if (x > M_PI) {
		x = x - M_PI;
		sign = -1;
	} else if (x > M_PI_2) {
		x = M_PI - x;
		sign = -1;
	}
	if (x > M_PI_4) {
		return sign * sin(M_PI_2 - x);
	}
	for (i = 0; i < 8; i += 4) {
		out += x_pow / __trig_factlist[i];
		x_pow *= x * x;
		out -= x_pow / __trig_factlist[i + 2];
		x_pow *= x * x;
	}

	return sign * out;
}

double tan(double x) {
    return sin(x) / cos(x);
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
