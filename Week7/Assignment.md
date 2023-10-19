# Week 7

## This week we will use alphafold to predict structures, and learn how to use VMD to visualize these structures

The PDB: https://www.rcsb.org/

1. Get assigned one of the five proteins to study: (A) Ubiquitin, 1UBQ; (B) Streptavidin, 3RY2, (C) Lysozyme, 1LYS (D) RNaseP, 6D1R, (E) DHFR, 2W9T
	- Read about the function of this protein
	- Figure out how many amino acids there are
2. Get the sequence in fasta file format and PDB file format into your Inputs/ folder
3. Copy the script `/scratch/work/public/apps/alphafold/test-2.2.0/run-test.SBATCH` to your directory, edit and submit it to predict from your chosen fasta file
4. Start running your sequence through ColabFold: `https://colab.research.google.com/github/sokrypton/ColabFold/blob/main/AlphaFold2.ipynb`; When done download all results and add to your folder on Greene
5. Do the VMD tutorial from "Working with a Single Molecule" through "Working with Multiple Molecules", `https://www.ks.uiuc.edu/Training/Tutorials/vmd/tutorial-html/`
6. Load the crystal structure, colabfold structure, and best greene alphafold structure in VMD, and render each in different colors, save to your Figures directory. Put a note describing which is which based on color.
7. Using mdtraj, in a jupyter notebook, align your alphafold predictions to the crystal structure and make a bar plot showing the RMSD of each predicted structure to the crystal structure based on alpha-carbons and based on the full backbone and side-chains. Does alphafold get everything right or just the backbone structure? 
8. From your alphafold greene output, make a picture of your protein colored by PLDDT score (stored in B-factor column), and put it in your figures folder. Which residues should we be confident in?
9. (Bonus) In your jupyter notebook, load the pkl files and get the average PLDDT score for each predicted structure. Make a scatter plot of PLDDT vs RMSD of prediction. Are they correlated in your case?
10. (Bonus) Compare to RoseTTAFold: `https://colab.research.google.com/github/sokrypton/ColabFold/blob/main/RoseTTAFold.ipynb`
