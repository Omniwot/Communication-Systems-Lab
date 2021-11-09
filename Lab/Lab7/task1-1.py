import numpy as np
import matplotlib.pyplot as plt
from numpy.fft import fft
import random
from scipy.signal import hilbert

N = 10
signal_duration = 10
fc = 100
fs = 10*fc

for T in range(signal_duration):
 t_signal = np.arange(-0.5,0.5,1/fs)
 Am = random.randint(1,10)
 m_t = Am*np.cos(2*np.pi*N*t_signal)
 c_t = np.cos(2*np.pi*fc*t_signal)
 USSB = m_t*c_t - np.imag(hilbert(m_t))*np.sin(2*np.pi*fc*t_signal)
 LSSB = m_t*c_t + np.imag(hilbert(m_t))*np.sin(2*np.pi*fc*t_signal)

 plt.figure(1)
 plt.subplot(2,1,1)
 plt.plot(t_signal+1+T, USSB)
 plt.title('Time Domain USSB m(t)')
 plt.xlabel('Time(in sec)')
 plt.ylabel('Amplitude')

 yf1 = fft(USSB) / fs
 N1 = len(yf1)
 yf_abs_sorted1 = np.fft.fftshift(abs(yf1))
 freq_axis = np.linspace(-fs / 2, fs / 2, N1)

 plt.subplot(2,1,2)
 plt.title('Frequency domain USSB')
 plt.xlabel('Frequency(in Hz)')
 plt.ylabel('FFT amplitude')
 plt.plot(freq_axis, yf_abs_sorted1)
 plt.pause(0.1)

 plt.figure(3)
 plt.subplot(2,1,1)
 plt.plot(t_signal + 1 + T, LSSB)
 plt.title('Time Domain LSSB m(t)')
 plt.xlabel('Time(in sec)')
 plt.ylabel('Amplitude')

 yf2 = fft(LSSB) / fs
 N2 = len(yf2)
 yf_abs_sorted2 = np.fft.fftshift(abs(yf2))

 plt.subplot(2,1,2)
 plt.title('Frequency domain LSSB')
 plt.xlabel('Frequency(in Hz)')
 plt.ylabel('FFT amplitude')
 plt.plot(freq_axis, yf_abs_sorted2)
 plt.pause(0.1)

plt.show()