#ifndef __BCALL_H
#define __BCALL_H

#define BCALL(ADDRESS) \
    rst 0x28 \\ \
    .dw ADDRESS

/* Memory areas */
#define MEMAREA_CURROW 0x844B

/* BCALLs */
#define BCALL_CLRLCDFULL 0x4540
#define BCALL_PUTS 0x450A
#define BCALL_NEWLINE 0x452E
#define BCALL_HOMEUP 0x4558

#endif
