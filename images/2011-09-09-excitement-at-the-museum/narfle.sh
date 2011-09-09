#!/bin/sh

for i in `ls *.jpg`;
do
  convert -sample 640 $i thumbs/$i
  #base=`basename $i .png`
  #convert $i $base.jpg
  echo $i "done"
done
