#!/bin/bash

# Load, configure FreeSurfer
module load freesurfer/8.0
export SUBJECTS_DIR=/users/$(whoami)/projects
export FS_LICENSE=/users/$(whoami)/research_bin/license.txt
mkdir -p $SUBJECTS_DIR
source $FREESURFER_HOME/SetUpFreeSurfer.sh

# Update path
PATH=${PATH}:\
/users/$(whoami)/research_bin

export PATH

# User globals
SQL_PASS=$(cat ~/.ssh/pass_sql)
RSA_WS=~/.ssh/id_rsa_ws

# Load project conda env (assumes a named env alread exists)
conda activate proj_env