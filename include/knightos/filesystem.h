#ifndef __FILESYSTEM_H
#define __FILESYSTEM_H

#include <stdbool.h>
unsigned char check_filesystem();
void create_directory(const char *path);
void create_symlink(const char *path, const char *target_path);
void delete_file(const char *path);
bool directory_exist(const char *path);
bool file_exist(const char *path);
void fix_filesystem();
void rename_file(const char *path, const *char name);

#endif