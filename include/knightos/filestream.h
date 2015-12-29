#ifndef __FILESTREAM_H
#define __FILESTREAM_H
#include <stdbool.h>

char open_file_read(char *path);
char open_file_write(char *path);
bool close_stream(char stream_id);
bool write_byte(char stream_id, char value);
bool write_word(char stream_id, char *value);
char read_byte(char stream_id);
#endif