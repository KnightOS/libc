#include <math.h>

double fmod(double x, double div) {
	//if div or x is nan,return x directly
	if (div != div || x != x) {
		return x;
	}
	if (div == 0) {
		return 0.0 / 0.0;
	}
	return x - (int) (x / div) * div;
}
