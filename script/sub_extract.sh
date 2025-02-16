#!/bin/zsh

if [ "$1" = "-h" -o "$2" = "" -o "$1" = "" ] ; then
    echo "Usage: `basename $0` [-h]"
    echo "`basename $0` sub_type track_num"
    echo "eg. `basename $0` ass 3"
    exit 0
fi

str="s/\.mkv$/.$1/"

for file in *.mkv; do 
  sub=$(echo $file | sed $str);
  mkvextract tracks "${file}" $2:"${sub}";
done
