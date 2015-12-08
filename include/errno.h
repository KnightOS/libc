#ifndef __ERRNO_H
#define __ERRNO_H

extern int errno;
/* TODO: This isn't very portable, these probably belong in a /knightos/ file */

#ifndef __ERRNO_ERRORS_DEFINED
#define __ERRNO_ERRORS_DEFINED

#define E_OUT_OF_MEM 1
#define E_TOO_MANY_THREADS 2
#define E_STREAM_NOT_FOUND 3
#define E_END_OF_STREAM 4
#define E_FILE_NOT_FOUND 5
#define E_TOO_MANY_STREAMS 6
#define E_NO_SUCH_THREAD 7
#define E_TOO_MANY_LIBARIES 8
#define E_UNSUPPORTED 9
#define E_TOO_MANY_SIGNALS 10
#define E_FILE_SYSTEM_FULL 11
#define E_NAME_TOO_LONG 12
#define E_ALREADY_EXISTS 13
#define E_NO_MAGIC 14
#define E_NO_HEADER 15
#define E_NO_ENTRY_POINT 16
#define E_KERNEL_MISMATCH 17

#endif

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
