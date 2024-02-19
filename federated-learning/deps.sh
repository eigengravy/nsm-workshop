#!/bin/bash

#SBATCH -J machine-learing              # name of the job

#SBATCH -N 1

#SBATCH -p cpu                      # name of the partition: available options "cpu, hm or gpu"

#SBATCH --ntasks-per-node=4         # no of processes or tasks per node

#SBATCH -t 01:00:00                 # walltime in HH:MM:SS, Max value 72:00:00   gromacs/iwey76m

#SBATCH --error=job_%j.err

#SBATCH --output=job_%j.out

source /home/apps/anaconda3/bin/activate
conda activate machine-learning

# Define the list of Python packages you want to check
packages=("torch" "flwr" "flwr_datasets" "lightning")

# Function to check if package is installed
check_package() {
    python -c "import $1" &>/dev/null
    if [ $? -eq 0 ]; then
        echo "$1 is installed."
    else
        echo "$1 is not installed."
    fi
}

# Check each package
for pkg in "${packages[@]}"; do
    check_package "$pkg"
done
