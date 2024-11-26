#!/bin/bash
input=$1
db=$2
threads=$3

output=$(nameroot $file)
output=${output}_output

virsorter run -w $output -j $threads -i $input --db-dir=$db