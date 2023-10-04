# Week 5
1) Run an MD simulation of alanine dipeptide at 300K for 5 ns on 1 cpu, using gromacs 2018. The files are provided in Input/. The simulation should take about 1 minute

2) Use mdtraj in a jupyter notebook to compute the phi and psi dihedral angles from these data. Make a plot of phi vs time and psi vs time.

3) Make a free energy surface in phi, psi space from this data. In otherwords, compute a 2d histogram of the phi, psi data compute `F(phi,psi)=-log(histogram)`, and plot `F(phi,psi)-min(F(phi,psi))` nicely labeled, with a colorbar, etc

4) Parallel tempering 
- Set up 3 directories called `T300` `T363` and `T440` which contain a file adp.tpr, except the temperature in adp.tpr is equal to 300, 363 or 440 respectively.
- Request an interactive node with 3 tasks-per-node and 1 cpu per task
- Run a parallel tempering simulation that exchanges every 100 fs by doing
 `mpirun -np 3 gmx_mpi mdrun -s adp -multidir T300/ T363 T440/ -deffnm adp_exchange3temps -replex 50`
Check the log files to see what are in them. Is the exchange probability good?
- Using 'gmx_mpi energy', calculate the potential energy in each replica. Compute a histogram of energy in each case, and plot all the histograms on the same plot. Do they overlap well?
- Make a free energy surface for T=300 using the data in T=300. Do you now see the whole surface? Set the maximum free energy to 10 kT
- use the script demux.pl (available after loading gromacs module) on the log file in T300/ to generate files "replica_index.xvg  replica_temp.xvg". Plot how each replica is moving in temperature in replica_temp (you may have to do every 100 frame to see what's happening) and make sure it goes up and down

