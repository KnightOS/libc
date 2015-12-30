#ifndef __FILESYSTEM_H
#define __FILESYSTEM_H

#include <stdbool.h>

/**
* Creates a new directory
* Note: errno is set on error
**/
bool create_directory(char *path);

/**
* Creates a new symlink
* Note: errno is set on error
**/
void create_symlink(const char *path, const char *target_path);

/**
* Deletes the given file
* Note: errno is set on error
**/
void delete_file(const char *path);

/**
* Checks if a directory exists
**/
bool directory_exists(const char *path);

/**
* Checks if a file exists
**/
bool file_exists(const char *path);

/**
* Renames a file
* Note: errno is set on error
**/
void rename_file(const char *path, const *char name);


#endif