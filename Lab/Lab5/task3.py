import random
import time
from  numpy.fft import fft
import matplotlib.pyplot as plt
import numpy as np

for T in range(30):
    start_time_sinc=-10
    stop_time_sinc=10
    N=10
    fm=N
    fs=10*fm
    ts=1/fs

    time=np.arange(start_time_sinc,stop_time_sinc, ts)
    m_t = 2*N*np.sinc(2*N*time)

    a=1

    sigma=0.001 # change this

    mu = 0

    n_t=sigma*np.random.randn(len(m_t)) + mu

    y_t=a*m_t + n_t
    m_t=y_t

    mf=fft(m_t)/fs

    N=len(mf)
    mf_abs_sorted=np.fft.fftshift(abs(mf))

    freq_axis= np.linspace(-fs/2,fs/2, N)

    plt.figure(1)
    plt.plot(time+T,m_t)
    plt.title("Time Domain")

plt.show()
    