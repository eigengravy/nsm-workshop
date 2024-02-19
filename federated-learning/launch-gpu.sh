#!/bin/bash

#SBATCH -J machine-learing              # name of the job

#SBATCH -N 1

#SBATCH -p gpu                      # name of the partition: available options "cpu, hm or gpu"

#SBATCH --ntasks-per-node=4         # no of processes or tasks per node

#SBATCH -t 01:00:00                 # walltime in HH:MM:SS, Max value 72:00:00   gromacs/iwey76m

#SBATCH --gres=gpu:1                # script requests one GPU with ID 1

#SBATCH --error=job_%j.err

#SBATCH --output=job_%j.out

source /home/apps/anaconda3/bin/activate
conda activate machine-learning

srun python sim.py --num_gpus=0.5
