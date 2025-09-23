#!/bin/bash

# C-style
for ((i=1; i<5; i++)); do
    echo $i
done

# Using variables
start=1
end=5
for ((i=$start; i<$end; i++)); do
    echo $i
done

# While loops
cnt=1
while [ $cnt -lt 5 ]; do
    echo $cnt
    let cnt+=1
done

# Arrays
arr_foo=({a..d})
arr_fruit=(apple orange banana)
echo ${arr_foo[0]}
echo ${arr_fruit[2]}

# Using position
arr=({a..d})
echo "Array positions are ${!arr[@]}"

for pos in ${!arr[@]}; do
    echo "Array position $pos value is ${arr[$pos]}"
done

# Using length
hero=(batman superman aquaman)
color=(black red green)
echo "hero array length is ${#hero[@]}"

# Check arrays are same length
[ ${#hero[@]} == ${#color[@]} ] \
    || echo "Array length mismatch"

idx=0
while [ $idx -lt ${#hero[@]} ]; do
    echo "The hero ${hero[$idx]} wears ${color[$idx]}"
    let idx+=1
done

# Building variables, arrays
unset var_foo
unset arr_foo

[ -z $var_foo ] && echo empty

for i in {1..4}; do
    var_foo+="$i"
    arr_foo+=($i)
done

[ -z $var_foo ] || echo full

echo $var_foo
echo ${var_foo[@]}