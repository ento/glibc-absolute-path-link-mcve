What's in here:

- Makefile
- getaddrinfo.c - a small program that results in a call to dl_open_worker
- build.sh - optionally specify a prefix to build against glibc installed at non-standard location
- fixup_glibc_path.sh - replaces libc.so.6 in the given file's DT_NEEDED section with its absolute path
- info.sh - print the DT_NEEDED section and interpreter of a given file

Prerequisite:

- [patchelf](https://github.com/NixOS/patchelf)
- build scripts assume linux/x86_64
