#ifndef __FILESYSTEM_H
#define __FILESYSTEM_H

#include <stdbool.h>

bool create_directory(char *path);
void create_symlink(const char *path, const char *target_path);
void delete_file(const char *path);
bool directory_exists(const char *path);
bool file_exists(const char *path);
void rename_file(const char *path, const *char name);


#endif