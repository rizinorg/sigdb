#!/bin/sh

find . -name "*.sig" | grep -v "installdir" | cut -d '/' -f2- | sort > available-sigs.txt
find installdir -name "*.sig" | cut -d '/' -f2- | sort > installed-sigs.txt
DIFF=$(diff -u available-sigs.txt installed-sigs.txt)
if [ ! -z "$DIFF" ]; then
  echo "------------------------------------------------------------"
  echo " Not all the sig files has been installed in the directory."
  echo " Did you forget to modify meson.build and add a subfolder ?"
  echo "------------------------------------------------------------"
  diff -u available-sigs.txt installed-sigs.txt
  exit 1
else
  exit 0
fi
