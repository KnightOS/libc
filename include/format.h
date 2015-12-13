#include <stdarg.h>
#include <stdbool.h>
#include <stdint.h>
#include <ctype.h>

static bool format_byte(uint8_t num, uint8_t base, bool is_signed, struct format_data *data);
static bool format_char(char c, struct format_data *data);
static bool format_int(int base, bool is_signed, struct format_data *data);
static bool format_long(uint32_t num, uint32_t base, bool is_signed, struct format_data *data);
static bool format_num(char sign, char *num, int num_width, struct format_data *data);
static bool format_put_string(char c, void *data);
static bool format_short(uint16_t num, uint16_t base, bool is_signed, struct format_data *data);
static bool format_str(char *str, struct format_data *data);