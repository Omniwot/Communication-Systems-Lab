import numpy as np
import matplotlib.pyplot as plt
from  numpy.fft import fft

start_time=-2
stop_time=2
fm = 10    
fs=10*fm
ts=1/fs
time = np.arange(start_time,stop_time,ts)
h_t = 0.2*np.sinc(2*fm*time)    
hf = fft(h_t)/fs
N=len(hf)
freq_axis = np.linspace(-fs/2, fs/2, N)  

hf_abs= abs(hf)
hf_abs_sorted=np.fft.fftshift(hf_abs) 

T=3
m_t = [1 if abs(i)<=T/2 else 0 for i in time]
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
plt.title('Frequency Domain, for T=3')
plt.xlabel('Frequency')
plt.ylabel('Amplitude')
plt.tight_layout()
plt.show()