#!/bin/bash

filename=$1
LC_ALL=C

sed -i 's/[[:space:]]/,/g' $filename
sed -i 's/[()]//g' $filename
sed -i 's/[dB]//g' $filename
sed -i 's/�//g' $filename

mv $filename ${filename}.csv
