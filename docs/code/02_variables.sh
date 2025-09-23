#!/bin/bash

# Set variable
foo="Hello World"
echo $foo

# Use subshell to set path variable
my_path=$(pwd)
cd
cd $my_path

# Show PATH, location of echo
echo $PATH
which echo

# Expanding braces
echo {a..d}
echo sub-{1..3}
perm=$(echo {1..3}{a..c})
nest=$(echo pref-{foo,bar{1..3},baz})
echo $perm
echo $nest

# Combining variables
var1=foo; var2=bar
echo "1 ${var1}baz"
echo "2 ${var1}$var2"
echo "3 $var1$var2"

# Clip from front
bids_name=sub-1_ses-A_task-memory
echo $bids_name
echo ${bids_name#*_}
echo ${bids_name##*_}

# Clip from back
echo ${bids_name%_*}
echo ${bids_name%%_*}
int=${bids_name#*_}
echo ${int%_*}