import numpy as np
import matplotlib.pyplot as plt

N = 2      
fs = 1000    
t = np.arange(50)
signal_m = np.sin(2 * np.pi * N * 10 * (t/fs))
plt.title('Sinewave plot')

plt.plot(t, signal_m)


n = np.arange(50)
dt = 0.05/50
x = np.sin(2 * np.pi * 2 * 10 * n * dt)

plt.stem(n, x)
plt.show()