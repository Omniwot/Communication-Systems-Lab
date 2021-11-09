from scipy import stats
import scipy
from numpy import sqrt
from scipy.integrate import quad
import numpy as np

# Uniform distribution
a,b = 0,2
def uniform(x):
    return 1 / (b - a)
uniform_verify = quad(uniform, a, b)


# Gaussian distribution
mu,sigma = 0,1
def gauss(x):
    return scipy.stats.norm.pdf(x, mu, sigma)
gaussian_verify = quad(gauss, -np.inf, np.inf)


# Rayleigh Distribution
alpha = 2
def ray(x):
    return scipy.stats.rayleigh.pdf(x, alpha)
ray_verify = quad(ray, 0, np.inf)


# Exponential Distribution
beta = 2
def expdist(x):
    return scipy.stats.expon.pdf(x, beta)
expdist_verify = quad(expdist, 0, np.inf)

print("Uniform Distribution verification:", uniform_verify)
print("Gaussian Distribution verification:", gaussian_verify)
print("Rayleigh Distribution verification:", ray_verify)
print("Exponential Distribution verification:", expdist_verify)
