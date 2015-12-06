#ifndef __ERRNO_H
#define __ERRNO_H

extern int errno;

#define EDOM        33  /* Math argument out of domain of functions */
#define ERANGE      34  /* Math result not representable */

/* Bounds-checking interfaces from annex K of the C11 standard. */
#if defined (__STDC_WANT_LIB_EXT1__) && __STDC_WANT_LIB_EXT1__

#ifndef __ERRNO_T_DEFINED
#define __ERRNO_T_DEFINED
typedef int errno_t;
#endif

#endif

#endif  /* _INC_ERRNO */
