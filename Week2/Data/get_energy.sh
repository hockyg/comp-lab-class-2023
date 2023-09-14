#!/bin/bash
edrfile=1hz3_T310.run.25000000.edr
label=$(basename $edrfile .edr)
module load gromacs/openmpi/intel/2018.3
echo 11 12 13 15 17 22 | gmx_mpi energy -f $edrfile > $label.energy.out
mv energy.xvg ${label}.energy.xvg
