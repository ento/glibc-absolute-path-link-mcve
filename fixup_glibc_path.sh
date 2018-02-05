#!/usr/bin/env bash

set -e

target=$1
libc_soname=libc.so.6

resolved_libc_path=$(ldd "$target" | grep --fixed-strings "$libc_soname" | cut -d' ' -f3)

patchelf --replace-needed "$libc_soname" "$resolved_libc_path" "$target"
patchelf --print-needed "$target"
