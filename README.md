# libc

This is KnightOS's shared C library. Note that it is not compliant with any
particular standard and doesn't even slightly resemble POSIX. That being said,
where POSIX and KnightOS have similar functions, our libc does implement some
of the things you'd find in a POSIX-compliant OS.

## Compiling

First, install the [KnightOS SDK](http://www.knightos.org/sdk).

    $ knightos init
    $ make

## Installing

Use `make package` to get a package that you can install.

## Contributing

This project follows the same standards for contribution as the rest of the KnightOS userspace.
These standards are documented [at KnightOS/KnightOS on GitHub](https://github.com/KnightOS/KnightOS/blob/master/CONTRIBUTING).
