#ifndef __FILESTREAM_H
#define __FILESTREAM_H
#include <stdbool.h>

/**
* Open a file in read-only mode.
**/
char open_file_read(char *path);

/**
* Open a file in write mode. Creates the file if it doesn't exist.
**/
char open_file_write(char *path);

/**
* Close an open stream
**/
bool close_stream(char stream_id);

/**
* Writes a byte to a file stream and advances the stream 
**/
bool write_byte(char stream_id, char value);

/**
* Writes a word to a file stream and advances the stream 
**/
bool write_word(char stream_id, char *value);

/**
* Reads a byte from a file stream and advances the stream 
**/
char read_byte(char stream_id);
#endif