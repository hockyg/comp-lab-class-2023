#!/bin/bash
#SBATCH --nodes=4
#SBATCH --tasks-per-node=30
#SBATCH --cpus-per-task=1
#SBATCH --time 8:00:00
#SBATCH --mem 100GB
#SBATCH --job-name cp2k-equil
module load cp2k/openmpi/intel/20201212
srun cp2k.popt monitor.inp > monitor.out
