#!/bin/sh

for i in `ls *.png`;
do
  convert -sample 640 $i thumbs/$i
done
