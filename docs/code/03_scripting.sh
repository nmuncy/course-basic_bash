#!/bin/bash

# Create new script
touch new_script.sh

# Content for script
# Use positional slicing
alpha="abcdefg"
let_e=${alpha:4:1}
let_g=${alpha:6}
echo ${let_e}${let_g}${let_g}

# Use character slicing
beta="aaa-bbb_ccc"
int_var=${beta#*-}
echo ${int_var%_*}

# Check script mode
ls -l new_script.sh

# Change script mode
chmod +x new_script.sh
chmod 755 new_script.sh

# Execution environments
touch test_env.sh
FOO=bar
export BAZ=bat

# Execute script in different shells
. test_env.sh
chmod +x test_env.sh
./test_env.sh
