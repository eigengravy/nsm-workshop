#!/bin/bash

#SBATCH -J machine-learning              # name of the job

#SBATCH -N 1

#SBATCH -p cpu                      # name of the partition: available options "cpu, hm or gpu"

#SBATCH --ntasks-per-node=4         # no of processes or tasks per node

#SBATCH -t 01:00:00                 # walltime in HH:MM:SS, Max value 72:00:00   gromacs/iwey76m

#SBATCH --error=job_%j.err

#SBATCH --output=job_%j.out

source /home/apps/anaconda3/bin/activate
conda activate machine-learning

# run script from above
srun python3 lightning.py
