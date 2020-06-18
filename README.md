# libc

[![builds.sr.ht status](https://builds.sr.ht/~pixelherodev/libc/commits.svg)](https://builds.sr.ht/~pixelherodev/libc/commits?)

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

## Licensing

There are several codebases put together into this one. There is the KnightOS
portion, which is licensed under the highly permissive MIT license, per the
usual KnightOS fare. Additionally, standard C libraries and low level support
(ala libgcc) is included here under the GPL license, and in some cases
effectively public domain. The oddly licensed code is under src/gpl/ and each
file details the licensing considerations within the file itself. Please note
that the GPL-ed portions have a linking exception, which means that you are free
to link with them without inheriting the GPL for your own programs.

## Help, Bugs, Feedback

If you need help with KnightOS, want to keep up with progress, chat with
developers, or ask any other questions about KnightOS, you can hang out in the
IRC channel: [#knightos on irc.freenode.net](http://webchat.freenode.net/?channels=knightos).
 
To report bugs, please create [a GitHub issue](https://github.com/KnightOS/KnightOS/issues/new) or contact us on IRC.
 
If you'd like to contribute to the project, please see the [contribution guidelines](http://www.knightos.org/contributing).
