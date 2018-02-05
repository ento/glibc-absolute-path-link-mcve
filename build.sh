#!/usr/bin/env bash

set -e

with_glibc="$1"

if [ -z "$with_glibc" ]; then
    make
else
    # note: linker arch and version is hardcoded here
    linker=ld-linux-x86-64.so.2
    CFLAGS="-I$with_glibc/include" \
	  LDFLAGS="-L$with_glibc/lib -Wl,-rpath,$with_glibc/lib -Wl,--dynamic-linker=$with_glibc/lib/$linker" \
	  make
fi
