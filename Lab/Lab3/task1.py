import numpy as np
import matplotlib.pyplot as plt
from  numpy.fft import fft
start_time=-2
stop_time=2
fm = 10    # Maximum frequency component in Hertz for the given spectrum
fs=10*fm
ts=1/fs
time = np.arange(start_time,stop_time,ts)
h_t = 0.2*np.sinc(2*fm*time)    
h_f = fft(h_t)/fs
N=len(h_f)
freq_axis = np.linspace(-fs/2, fs/2, N)  
hf_abs= abs(h_f)
hf_abs_sorted=np.fft.fftshift(hf_abs)   

fig, axis=plt.subplots(2)
axis[0].plot(time,h_t)
axis[0].set(xlabel='Time',ylabel="Amplitude",title="Time Domain")
axis[1].plot(freq_axis,hf_abs_sorted)
plt.title('Frequency Domain')
plt.xlabel('Frequency')
plt.ylabel('Amplitude')
plt.tight_layout()
plt.show()