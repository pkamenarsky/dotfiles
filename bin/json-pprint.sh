#!/bin/bash
file=$1
if [ "${file#*.}" = "gz" ]; then
	gzip -d $file
	file="${file%%.*}"
fi

out=$file
if [ "${file#*.}" = "json" ]; then
	out="${file%%.*}"
fi

cat $file | python -mjson.tool > $out.pprint.json
