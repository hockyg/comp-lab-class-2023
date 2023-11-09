# Week 10

## Using psi4 in python to run quantum calculations

## Part 1
- Make a Jupyter notebook, use the lab_env environment

- Do the psi4 tutorial at this url: https://psicode.org/psi4manual/master/psiapi.html

- For each step, run the code in a cell in your notebook

- **Time each step,** by adding `%%time` at the top of each cell

## Part 2

When you get to the end of the tutorial, you will have computed the energy of Neon at several different distances.

- Now for this part, compute the energy of two Argon molecules at distances from 3.5 to 6 angstroms
- Use scipy curve_fit to fit this curve to a lennard-jones potential with parameters `sigma` and `eps` as below

```
def lj(r,sigma,eps):
    return 4*eps*( (sigma/r)**12-(sigma/r)**6  )`
```

- Make a nice plot of the energy versus distance with the computed values as dots and the values from the fit function with a dashed line, as shown in the lecture
- Save this figure in the figures directory
