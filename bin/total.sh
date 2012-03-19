#!/bin/sh
cut -d ';' -f 4 $1 | awk '{total = total + $1}END{print total}'

