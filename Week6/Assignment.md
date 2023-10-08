# Week 6 - Metadynamics

This week, we will learn how to perform Well-tempered Metadynamics using PLUMED. We will use as a base the PLUMED [masterclass 21-4 from this website](https://www.plumed.org/doc-master/user-doc/html/masterclass-21-4.html) and [Lugano tutorial](https://www.plumed.org/doc-master/user-doc/html/lugano-3.html). 

I have already put the input files needed in to the Inputs folder.

Note: Running these simulations requires an older version of Gromacs+plumed than the one in the modules.

To load gromacs this time, type `source /scratch/work/courses/CHEM-GA-2671-2023fa/software/gromacs-2019.6-plumedSept2020/bin/GMXRC.bash.modules`. This will also give you access to the command `plumed` on the command line.

Make a jupyter notebook for analysis that generates any of the required plots when the tutorial says "visualize" or "plot"

1. Read the Overview of the theory section in [PLUMED masterclass](https://www.plumed.org/doc-master/user-doc/html/masterclass-21-4.html), so you can see the notation used in this tutorial. In particular, you must understand the term "bias factor" used later.
2. Do masterclass exercise 1. The unbiased simulations should run in about 2 minutes on 1 cpu
	- Use numpy to read in the COLVAR files and matplotlib to plot the dihedrals.
	- Use mdtraj to compute the phi and psi dihedrals from the output xtc file. Plot them on top of the ones from the COLVAR file, making sure they agree!
	- **I suggest you plot phi vs psi with plt.scatter to get a ramachandran-like plot instead of looking vs time**
	- Compute the standard deviation of phi and the standard deviation of psi from the unbiased runs to give you an idea of the SIGMA values for metadynamics in the next step. 
3. Now switch to [Lugano tutorial](https://www.plumed.org/doc-master/user-doc/html/lugano-3.html) and do exercise 1, the first metadynamiscs simulation, starting from structure A, **using bias factor 10**.
	- The full reference is in the [documentation](https://www.plumed.org/doc-master/user-doc/html/_m_e_t_a_d.html)
	- Make sure the command is `metad: METAD ...` and the rest is on separate lines after. Careful if you're using a non-standard text editor.
		- Backup, put all on one line and remove ... if you still have error
	- In addition to the inputs in the tutorial, try adding `GRID_WFILE=__FILENAME__.grid.dat GRID_WSTRIDE=10000` to write out a grid file.
	- The grid file has the bias. Plot the negative of the energy column in the grid file, does it look like the FES? Is it slightly different? Perhaps scaled by a constant that you can figure out?
4. Do all of Lugano exercise 2.
	- [*optional In addition to what is said, try either a different hill height or sigma value and see how it changes the speed of convergence*]
5. [*optional Do Lugano exercise 3 - try at least 3 different bias factors to see how this affects your results.*]
	- [*Show the exploration of phi for these different bias factors, what do you notice?*]
	- [*What is the smallest you can pick where the barriers are not surmounted?*]
	- [*Plot the final Free Energy for each one, does it look the same?*]
6. **Important** Now we will do 2d metadynamics in phi and psi
	- Put `ARG=phi,psi` and for `SIGMA=sigma_phi,sigma_psi`
	- Run at least 10 ns and check convergence of the FES with `sum_hills`. Is your bias factor and height okay or do you need to change it? Or run longer?
	- `sum_hills` should produce a grid file which you can plot with imshow. Make a free energy surface with labeled axes and color bar. This time, add contour lines. This should look more like a surface than from replica exchange! 
	- Bonus: If you use the `--stride` function to get many surfaces, can you make an animated gif of the free energy surface filling in?

**As usual, save the relevant figures with good titles etc in a Figures folder, and give your files good names**. 
I.e. we should not see just COLVAR but things like `ala2_metad_biasfactor10_pace500_height1.2_sigma0.3_10ns.colvar.txt` and similarly for hills, xtc...
