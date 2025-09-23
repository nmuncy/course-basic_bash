#!/bin/bash

# Print positional arguments
echo $0
echo $1
echo $2

# Capture positional arguments
foo=$1
bar=$2
echo $foo $bar

# Redirect stdout
echo foo > out.log
echo bar >> out.log

# Redirect stderr
echo error 2> err.log
echo error 2>&1 out_err.log

# Simple job script

#$ -pe smp 2
#$ -q long

subj=$1
echo "The subject is $subj"

# Simple wrapper script (and wait one sec between each loop)
# It is good practice to not blast the scheduler with jobs
for subj in {1..3}; do
    qsub -N subj$subj job.sh $subj
    sleep 1
done

# Use logging in wrap script
work_dir=/scratch365/$(whoami)/test
date_time=$(date +"%Y-%m-%d_%H-%M-%S")
job_name=foo
log_dir=${work_dir}/${job_name}_$date_time
mkdir -p $log_dir

for subj in {1..3}; do
    qsub \
        -o ${log_dir}/${job_name}${subj}.out \
        -N ${job_name}${subj} \
        job.sh $subj
    sleep 1
done

# Check status
qstat
qstat | head
qstat | wc -l
qstat -u $(whoami)
qstat -j jobid
qstat -u $(whoami) -g t

# Kill job
qdel jobid

# Check available resources
free_nodes.sh -G
qstat -u $(whoami) -g t