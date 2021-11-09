import numpy as np
import matplotlib.pyplot as plt
import random
from scipy.signal import hilbert

signal_duration=10

for T in range(10):
 t_start=-0.5
 t_stop=0.5
 carrier_freq=500
 fs=10*carrier_freq
 ts=1/fs
 time=np.arange(t_start,t_stop,ts)
 A=25
 carrier_t=A*np.cos(2*np.pi*carrier_freq*time)
 carrier_f=np.fft.fftshift(abs(np.fft.fft(carrier_t)/fs))
 len_time=len(time)
 freq_axis=np.linspace(-fs/2,fs/2,len_time)
 B=random.randint(1,5)
 m_t=20*B*np.sinc(20*B*time)
 m_f=np.fft.fftshift(abs(np.fft.fft(m_t)/fs))
 mod_t=(1+m_t/A)*carrier_t
 mod_f=np.fft.fftshift(abs(np.fft.fft(mod_t)/fs))
 mu=0
 sigma_sq=0.001
 sigma=np.sqrt(sigma_sq)
 n_t=mu+sigma*np.random.randn(len(time))
 op_t=0.01*mod_t+n_t
 op_f=np.fft.fftshift(abs(np.fft.fft(op_t)/fs))
 op_demod_t=abs(hilbert(op_t))-A*0.01
 op_demod_f=np.fft.fftshift(abs(np.fft.fft(op_demod_t)/fs))

 plt.figure(1)
 plt.subplot(5,1,1)
 plt.plot(time+T,m_t)
 plt.title('Message signal-time domain')
 plt.xlabel('Time(in sec)')
 plt.ylabel('Amplitude')

 plt.figure(1)
 plt.subplot(5, 1, 2)
 plt.plot(time + T, carrier_t)
 plt.title('Carrier Signal-time domain')
 plt.xlabel('Time(in sec)')
 plt.ylabel('Amplitude')

 plt.figure(1)
 plt.subplot(5, 1, 3)
 plt.plot(time + T, mod_t)
 plt.title('Modulated signal-time domain')
 plt.xlabel('time(in sec)')
 plt.ylabel('Amplitude')

 plt.figure(1)
 plt.subplot(5, 1, 4)
 plt.plot(T+time, op_t)
 plt.title('Modulated signal after channel time domain')
 plt.xlabel('time(in sec)')
 plt.ylabel('Amplitude')

 plt.figure(1)
 plt.subplot(5, 1, 5)
 plt.plot(time + T, op_demod_t)
 plt.title('Demodulated signal-time domain')
 plt.xlabel('time(t)')
 plt.ylabel('Amplitude')

 plt.figure(2)
 plt.subplot(5, 1, 1)
 plt.plot(freq_axis, m_f)
 plt.title('Message signal-frequency domain')
 plt.xlabel('Frequency (in Hz)')
 plt.ylabel('Magnitude')

 plt.figure(2)
 plt.subplot(5, 1, 2)
 plt.plot(freq_axis, carrier_f)
 plt.title('Carrier signal-frequency domain')
 plt.xlabel('Frequency(in Hz)')
 plt.ylabel('Magnitude')

 plt.figure(2)
 plt.subplot(5, 1, 3)
 plt.plot(freq_axis, mod_f)
 plt.title('Modulated signal-frequency domain')
 plt.xlabel('Frequency(in Hz)')
 plt.ylabel('Magnitude')

 plt.figure(2)
 plt.subplot(5, 1, 4)
 plt.plot(freq_axis, op_f)
 plt.title('Modulated signal after channel frequency domain')
 plt.xlabel('Frequency(in Hz)')
 plt.ylabel('Magnitude')

 plt.figure(2)
 plt.subplot(5, 1, 5)
 plt.plot(freq_axis, op_demod_f)
 plt.title('Demodulated signal frequency domain')
 plt.xlabel('Frequency(in Hz)')
 plt.ylabel('Magnitude')
 plt.pause(0.5)

plt.show()