#!/usr/bin/env bash

WORK_DIRS="start infos os tools tutorials"
TERM_1="http:"
TERM_2="[]"
TERM_3="[]()"
TERM_4="kaisen-linux.org"
TERM_5="https:"

# 1. search occurences of http: or []() or kaisen-linux.org

for dirs in $WORK_DIRS
do
  for i in $(seq 1 5)
do
	grep -iwc $TERM_$i $dirs/*.md >> control_count.log
        grep -w $TERM_$i $dirs/*.md >> control_word.log
  done
done

grep -v \:0 control_count.log > control_counts.log
rm control_count.log
