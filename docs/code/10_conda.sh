#!/bin/bash

# Activate conda on CRC
module avail | grep conda
module load conda
conda init
source ~/.bashrc
module unload conda
conda info

# Create environments
conda list
conda create -n test_name
conda create -p ~/test_path
conda env create -f test_name.yml

# De/activate
conda activate test_name
conda activate ~/test_path
conda deactivate

# To avoid seeing full path in prefix envs
# add the command below to ~/.condarc
env_prompt: '({name})'

# Install python 3.8 to test_name
conda activate test_name
conda install -c conda-forge python=3.8

# Export envs
conda env export > test_name.yml
conda list --explicit > test_name.txt

# Remove envs
conda env remove -n test_name
conda env remove -p ~/test_path