#include <math.h>

double fmod(double x, double div) {
	if(div != div) {
		return x;
	}
	if(div == 0) {
		return 0.0 / 0.0;
	}
	while(x > div) {
		x -= div;
	}
	return x;
}
