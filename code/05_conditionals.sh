#!/bin/bash

# Check exit status
echo hi
echo $?
asdf
echo $?

# Use exit status
echo hi && echo pass || echo fail
asdf && echo pass || echo fail

# Assert with square braces
[ 1 == 1 ] && echo true || echo false
[ 1 == 2 ] && echo true || echo false
[ a == a ] && echo pass $? || echo fail $?
[ a == b ] && echo pass $? || echo fail $?

# if-then
if [ 1 == 1 ]; then
    echo Yay
fi
if [ 1 == 2 ]; then
    echo Nay
fi

# elif
foo=bat
if [ $foo == bar ]; then
    echo foobar
elif [ $foo == baz ]; then
    echo foobaz
elif [ $foo == bat ]; then
    echo foobat
fi

# else
foo=foo
if [ $foo == bar ]; then
    echo foobar
elif [ $foo == baz ]; then
    echo foobaz
elif [ $foo == bat ]; then
    echo foobat
else
    echo "Unrecognized value of foo"
fi

# and
foo=bar
num=1
if [ $foo == bar ] && [ $num == 1 ]; then
    echo Success
fi

# or
alpha=a
num=1
if [ $alpha == b ] || [ $num == 1 ]; then
    echo Success
fi

# not
[ a != b ] && echo $?
[ ! foo == bar ] && echo $?

# compare ints
[ 1 -lt 2 ] && echo 1 $?
[ ! 1 -gt 2 ] && echo 2 $?
[ 1 -le 2 ] && echo 3 $?
[ ! 1 -ge 2 ] && echo 4 $?

## flight control
# Flight control with variable
foo=""
foo_empty=$([ -z $foo ] && echo $? || echo $?)
[ $foo_empty == 0 ] && echo set_var || echo move_on

# Flight control with file
touch foo.txt
foo_exists=$([ -f foo.txt ] && echo $? || echo $?)
[ $foo_exists == 0 ] && echo move_on || echo make_foo