#!/bin/bash

#SBATCH -p hpc-bio-ampere
#SBATCH --chdir=./Lab_3
#SBATCH --cpus-per-task=1
INPUT_FILE=$1



TOTAL=$(wc -l < "$INPUT_FILE")


LINES=$((TOTAL / 8))

TEMP_FILE="${INPUT_FILE}.tmp"

# Cortar las primeras líneas y guardar en fichero temporal
head -n "$LINES" "$INPUT_FILE" > "$TEMP_FILE"
