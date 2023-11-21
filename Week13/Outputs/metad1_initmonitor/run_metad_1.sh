#!/bin/bash
#SBATCH --nodes=3
#SBATCH --tasks-per-node=20
#SBATCH --cpus-per-task=1
#SBATCH --threads-per-core=1
#SBATCH --time 24:00:00
#SBATCH --mem 300G
#SBATCH --job-name cp2k-metad-1-newstart
module load cp2k/openmpi/intel/20201212
srun cp2k.popt metadynamics.inp > metad_v1.out
