import numpy as np
import matplotlib.pyplot as plt
from  numpy.fft import fft


start_time=-2
stop_time=2
fm = 20    # Maximum frequency component in Hertz for the given spectrum
fs=10*fm
ts=1/fs
time = np.arange(start_time,stop_time,ts)
h_t = 0.2*np.sinc(2*fm*time)    
h_f = fft(h_t)/fs
N=len(h_f)
freq_axis = np.linspace(-fs/2, fs/2, N)  

hf_abs= abs(h_f)
hf_abs_sorted=np.fft.fftshift(hf_abs)   

m_t = np.sin(10*np.pi*time) + np.sin(40*np.pi*time)
y_t = np.convolve(m_t,h_t)
y_f = fft(y_t)/fs
Ny = len(y_f)
freq_axis_y = np.linspace(-fs/2, fs/2, Ny)
yf_abs = abs(y_f)
yf_abs_sorted = np.fft.fftshift(yf_abs)


fig, axes=plt.subplots(2)
axes[0].plot(y_t)
axes[0].set(xlabel='Time',ylabel="Amplitude",title="Time Domain")
axes[1].plot(freq_axis_y,yf_abs_sorted)
plt.title('Frequency Domain')
plt.xlabel('Frequency')
plt.ylabel('Amplitude')
plt.show()