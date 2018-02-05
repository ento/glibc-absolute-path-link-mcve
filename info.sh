#!/usr/bin/env bash

set -e

target=$1
echo $target --------------------------------
echo interpreter:
patchelf --print-interpreter $target
echo needed:
patchelf --print-needed $target
