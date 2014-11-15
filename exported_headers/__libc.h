#ifndef __LIBC_H
#define __LIBC_H

#define __LIBC_ID 0xC0

#define __LIBC_CALL(ADDRESS) \
    RST 0x10 \ \
    .dw __LIBC_ID \ \
    CALL address \

#endif
