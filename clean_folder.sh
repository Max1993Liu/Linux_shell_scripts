#!/usr/bin/env bash
#clean up all the files in a directory with no content


usage="Usage:clean_folder [directory"

if [ $# -eq 0 -o $# -gt 1 ]; then
  echo $usage 1>&2
  exit 1
fi

if [ ! -d $1 ]; then 
  echo "Your input is not a directory"
  echo $usage 1>&2
  exit 1
fi

directory=$1

set -- $(ls  $directory)


for file in $@
do
  set -- $(ls -l $file)
  #if size equals to 0, delete the file
  if [ $5 -eq 0 ]; then 
    rm $file
    echo $file "is deleted."
  fi 
done
