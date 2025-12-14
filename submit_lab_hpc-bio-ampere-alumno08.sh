#!/bin/bash

#SBATCH -p hpc-bio-ampere
#SBATCH --chdir=./Lab_3
#SBATCH --cpus-per-task=1
#SBATCH --ntasks=4

for file in *.fastq; do
    [ -f "$file" ] || continue
    ./file-cut.sh "$file" &
    
    while [ $(jobs -r | wc -l) -ge 4 ]; do
        sleep 0.1
    done
done


