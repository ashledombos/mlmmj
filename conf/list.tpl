#!/bin/bash
# mlmmj-list wrapper

LIST_PATH="/var/spool/mlmmj/files/__APP__"
MLMMJ_LIST="/usr/local/bin/mlmmj-list"

OPTIONS=""
while getopts 'cdmnoh' flag; do
  case "${flag}" in
    c|d|m|n|o) OPTIONS="$OPTIONS -$flag" ;;
    h) echo "Usage: list-$app [options]
Options:
-c Print subscriber count
-d Print for digesters list
-m Print moderators for list
-n Print for nomail version of list
-o Print owner(s) of list"
    exit 0
    ;;
    *) echo "Invalid option"; exit 1 ;;
  esac
done

$MLMMJ_LIST $OPTIONS -L $LIST_PATH


