#!/bin/bash

# Basic for loop example
for i in {1..3}; do
    echo $i
done

# Multiple lists
my_sent="i am great"
num_list=$(echo {1..3})
# file_list=$(ls .)
for var in $my_sent $num_list; do
    echo $var
done

# Nested lists
for num in {1..3}; do
    for alpha in {a..c}; do
        echo ${num}$alpha
    done
done

# Flatten nests
for num in {1..2}; do
    for alpha in {a..b}; do
        echo ${num}$alpha
    done
done
echo
for num_alpha in {1..2}{a..b}; do
    echo $num_alpha
done