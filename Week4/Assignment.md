# Assignment for Lab 4

This week we are going to set up MD simulations and analyze them using CHARMM-GUI. CHARMM-GUI is a website developed by the lab of Woonpil Im and others to enable setting up much more complex initial configurations for MD, and generating the input files for different MD engines.

CHARMM-GUI Solution Builder - https://charmm-gui.org/?doc=input/solution

## MD simulation of a protein in solution, trp-cage case study
1. Set up a system containing the miniprotein trp-cage (https://www.rcsb.org/structure/2JOF) **using all default options** until the PBC setup page
2. *On step 3*, Choose AMBER as the forcefield (default) and change water to OPC; **select GROMACS under input file generator,** and choose the temperature 310 K
3. Download the final tgz file to your file and transfer to HPC under `Week4/Setup`
4. Untar the file (look up if you don't know how) to get a folder. I suggest you rename this folder to have the protein name and forcefield in it;  go into the directory `./gromacs`
5. Read the README file in the GROMACS folder and try to understand what it does; note that this is a C-shell script not a bash script
6. Copy my README.bash script from the Scripts directory to this Gromacs directory as the script `run_setup.sbatch`. Compare my script to the one from CHARMM-GUI, do you see what the differences are? 
7. Modify production `step5_production.mdp` to run for 10 ns, so that the run script does 100 total ns
8. At the top of `run_setup.sbatch`, add sbatch options for running this job on 20 cores for 24 hours (it should take about 12 hours)
9. Once all simulations are done, concatenate the trajectories, wrap the protein, and remove the solvent.
To concatenate the system, you can use gromac's trjcat utility.
To wrap the protein, and remove the solvent, you should use gromacs's trjconv utility. A good example for the wrapping part is here: https://adkgromacstutorial.readthedocs.io/en/latest/visualization.html ; To get only the protein written out, you would have to select protein rather than the whole system.
10. Make well labeled plots of end-end distance and radius of gyration vs time for this production trajectory in a Jupyter notebook in the Analysis folder, saving figures to Figures

## Simulation of ions in water
1. Set up a system of only water and ions, using 0.1 M NaCl in a 50x50x50 angstrom^3 box. 
2. Choose CHARMM36M as forcefield and temperature 300K. This time, choose NVT as the production ensemble at the bottom. **make sure to select Gromacs** as the MD engine
3. Transfer and untar in Setup again, making sure to name your directories well
4. Modify the `step5_production.mdp` to write out snapshots, velocities, and forces every 10 ps (which option is this)
5. Copy `run_setup.sbatch` from the first project, and change it to run on 10 cpus for 4 hours (it should take < 3); submit (wow everything else is the same!)
6. Concatenate the trajectories and this time, unwrap using the ' trjconv -pbc nojump ' option of gromacs. If you open in VMD, you will see the molecules seem to spread out!
7. In a jupyter notebook, compute the mean squared displacement for the Water Oxygens, the Sodium, and the Oxygen using mdtraj or MDAnalysis (you don't have to wait for the simulation to finish to start working on this)
8. Plot the MSD vs time of all 3 on the same plot in a jupyter notebook in the Analysis folder, and save in the Figures folder

## Turning in the assignment
Add your sbatch scripts, production mdp, production gro files, jupyter notebooks, and Figures folder to git repository, commit, and push to your github.
