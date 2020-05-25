#!/bin/bash

case "$0" in
 /*) self="$0" ;;
 *) self="$PWD/$0" ;;
esac

self=$(readlink $self)
bin_dir=$(dirname $self)
static_dir=$(cd "$bin_dir/../static"; pwd)

"$bin_dir/goconvey" --static-dir="$static_dir" "$@"
