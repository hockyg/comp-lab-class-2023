# this script computes the end to end distance using mdtraj

import mdtraj as md
import numpy as np

# load the trajectory
# top file is Data/1hz3_T310.start.nowater.gro
# trajectory file is Data/1hz3_T310.stepid25000000.every100ps.nowater.xtc

traj = md.load_xtc('Data/1hz3_T310.stepid25000000.every100ps.nowater.xtc', top='Data/1hz3_T310.start.nowater.gro')

def end_end(traj):
    """Compute the end to end distance of a trajectory"""
    # get the positions of the first and last atoms
    first = traj.xyz[:,0,:]
    last = traj.xyz[:,-1,:]
    # compute the distance between the first and last atoms
    dist = np.linalg.norm(first - last, axis=1)
    return dist

# compute the end to end distance
dist = end_end(traj)

# print the mean and standard deviation
print('mean = ', np.mean(dist))
print('std = ', np.std(dist))

# plot the distribution
import matplotlib.pyplot as plt
plt.hist(dist, bins=100)
plt.xlabel('end to end distance (nm)')
plt.ylabel('frequency')