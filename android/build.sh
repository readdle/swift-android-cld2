#!/bin/sh
current_dir="`pwd`"

if test "x$ANDROID_NDK" = x ; then
  echo should set ANDROID_NDK before running this script.
  exit 1
fi

cd "$current_dir/jni"
$ANDROID_NDK/ndk-build

