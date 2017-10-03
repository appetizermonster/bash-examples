#!/bin/bash
#
# Prints tomorrow's date

DATE_UTIL="date"

if [ $(uname -s) == 'Darwin' ]; then
  DATE_UTIL="gdate"
fi

TOMORROW=$($DATE_UTIL -d "+1 day" '+%Y-%m-%d')
echo "Tomorrow is $TOMORROW"

