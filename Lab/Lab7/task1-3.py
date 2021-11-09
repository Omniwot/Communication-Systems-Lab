import numpy as np
import matplotlib.pyplot as plt
from numpy.fft import fft
import random


N = 10
signal_duration = 10
fc = 100
kp = 100
B = 2*(N + kp*10*N)
fs = 10*B

for T in range(signal_duration):
 t_signal = np.arange(-0.5,0.5,1/fs)
 Am = random.randint(1,10)
 m_t = Am*np.cos(2*np.pi*N*t_signal)
 PM = np.cos(2*np.pi*fc*t_signal + kp*m_t)

 plt.figure(1)
 plt.subplot(2,1,1)
 plt.plot(t_signal+0.5+T, PM)
 plt.title('Time Domain PM m(t)')
 plt.xlabel('Time(in sec)')
 plt.ylabel('Amplitude')

 yf = fft(PM) / fs
 N1 = len(yf)
 yf_abs_sorted = np.fft.fftshift(abs(yf))
 freq_axis = np.linspace(-fs / 2, fs / 2, N1)

 plt.subplot(2,1,2)
 plt.title('Frequency domain PM')
 plt.xlabel('Frequency(in Hz)')
 plt.ylabel('FFT amplitude')
 plt.plot(freq_axis, yf_abs_sorted)
 plt.pause(0.1)

plt.show()