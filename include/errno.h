#ifndef __ERRNO_H
#define __ERRNO_H

extern int errno;
/* TODO: This isn't very portable, these probably belong in a /knightos/ file */
typedef enum {
    ERR_OUT_OF_MEM = 1,
    ERR_TOO_MANY_THREADS = 2,
    ERR_STREAM_NOT_FOUND = 3,
    ERR_END_OF_STREAM = 4,
    ERR_FILE_NOT_FOUND = 5,
    ERR_TOO_MANY_STREAMS = 6,
    ERR_NO_SUCH_THREAD = 7,
    ERR_TOO_MANY_LIBRARIES = 8,
    ERR_UNSUPPORTED = 9,
    ERR_TOO_MANY_SIGNALS = 10,
    ERR_FILE_SYSTEM_FULL = 11,
    ERR_NAME_TOO_LONG = 12,
    ERR_ALREADY_EXISTS = 13,
    ERR_NO_MAGIC = 14,
    ERR_NO_HEADER = 15,
    ERR_NO_ENTRY_POINT = 16,
    ERR_KERNEL_MISMATCH = 17
} KERNEL_ERROR;

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
