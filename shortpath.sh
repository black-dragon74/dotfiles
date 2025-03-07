#!/usr/bin/env bash

# A nifty utility that prints the PWD in a shortened format.
# Place this file in your PATH by removing the .sh extension
# If path is: /Our/Custom/path/to/dir
# It will output: /O/C/p/t/dir
# For directories inside $HOME, ~ is used.
path="${1:-$(</dev/stdin)}"
home="$HOME"

# If the path is inside $HOME, replace it with ~
if [[ "$path" == "$home"* ]]; then
  path="~${path#$home}"
fi

# If the path is just `~`, use the username instead
if [[ "$path" == "~" ]]; then
  path="$USER"
fi

echo "$path" | awk -F'/' '{for (i=2; i<NF; i++) $i = substr($i, 1, 1)} 1' OFS='/'
