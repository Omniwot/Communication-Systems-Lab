import math
from math import pi
import random
import wave
import matplotlib.pyplot as plt
from scipy import signal
import numpy as np

N= 6
a = 0.2
sigma = np.random.random()

time_endpt = 30

for T in range(time_endpt):

    # Defining all the common parameters for each second
    start_time = 0
    stop_time = 1
    fm = 100  # Maximum frequency component in Hertz for the given spectrum - Last digit of ID number goes here
    fs = 10*fm
    ts = 1/fs
    time = np.arange(start_time,stop_time,ts)
    num_samp = (stop_time - start_time)*fs

    m_t = 2*N*np.sinc(2*N*time)
    #h_t = a*signal.unit_impulse(num_samp)
    #x_t = np.convolve(m_t, h_t, mode='same') / fs

    x_t = a*m_t

    n_t = 0.2*np.random.normal(0, sigma, num_samp)
    y_t = x_t + n_t

    plt.figure(1)
    plt.plot(time + T, y_t)
    plt.title('Time Domain')
    plt.xlabel('Time')
    plt.ylabel('Amplitude')
plt.show()