#!/bin/bash
LC_CTYPE=C && LANG=C

filename=$1
echo $filename

sed -i '' -E 's/[[:space:]]/,/g' $filename
sed -i '' -E 's/[^-+\.,[:alnum:]]//g' $filename
sed -i '' -E 's/dB//g' $filename
sed -i '' -E '1 s/^.*$/Frequency,Magnitude,Phase/' $filename

mv $filename ${filename}.csv
