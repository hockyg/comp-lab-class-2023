# Week 1

## Getting github set up
- Get GitHub student developer pack working
- Fork this github repository to your own repository by clicking "fork" and following the instructions

##  Set up your work folder on Greene
- ssh into greene: `ssh netid@greene.hpc.nyu.edu` on campus or using the VPN, or you can access the terminal by using `https://ood.hpc.nyu.edu`
- set up a link to your personal class folder by running `ln -s /scratch/work/courses/CHEM-GA-2671-2023fa/students/$USER $HOME/comp-lab-class`
- Now you can always get to your personal folder when you log in by typing `cd ~/comp-lab-class`
- Run the following command to set up the class python environment: `bash /scratch/work/courses/CHEM-GA-2671-2023fa/jupyter-setup/install_kernel.sh`, now this should be available when you start jupyter notebooks from ood

## Get some practice with the command line
- Brush up on command line. Do Command line, text-fu, and advanced-text fu (VIM part) on https://linuxjourney.com/
- Command line text editing - I suggest you learn to use the program VIM. The best tutorial is the built in one, which you can get by just typing vimvtutor on greene

## Git tutorial
Now that you know a bit about the command line, do a git tutorial so that you are ready to use it starting next week

Follow the first part of this git tutorial to learn the basic commands, up until the part about github, which we can discuss in class next time
https://www.w3schools.com/git/default.asp

## Extra - some programming practice:
If you've never programmed, learn a little python. A decent tutorial to follow might be https://www.w3schools.com/python/python_intro.asp from beginning to Arrays; to get regular python on greene run the command module load python/intel/3.8.6
Alternatively you could do this shorter one which is written by chemistry people (part 1-8) https://education.molssi.org/python_scripting_cms/. For this, you can get a notebook started by https://ood.hpc.nyu.edu/ -> Interactive Apps -> Jupyter Notebook on greene
