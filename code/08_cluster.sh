#!/bin/bash

# Syntax for SSH connection
ssh user@crcfe01.crc.nd.edu

# QSUB syntax for checking nodes
#$ -pe smp 2
#$ -q long
shopt -q login_shell && echo login || echo non-login
[[ $- == *i* ]] && echo interactive || echo non-interactive

# Submit qsub script 'test_nodes.sh' as job named 'node_check'
qsub -N node_check test_nodes.sh

# Check CRC home usage
quota

# Check CRC scratch usage
pan_df -H /scratch365/$(whoami)

# Scp
scp file.txt user@crcfe01.crc.nd.edu:~
scp -r user@crcfe01.crc.nd.edu:~/project ~/Desktop

# Rsync
rsync -rauv ~/project user@crcfe01.crc.nd.edu:~