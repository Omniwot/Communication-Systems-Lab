clear all
close all
duration_signal=29;
A=1;
for T = 0:duration_signal  %%%% Duration 30 seconds with interval of 1 sec.
    if T==0
    display('Transmission Started')
     display (T)
    elseif (T==duration_signal) 
        display('Transmission ends: see the final result')
     display (T)
    else
            display('Transmission in progress: please wait')
     display (T)
    end 
    freq=2;
  
    fs=8*freq;
    ts=1/fs;
    t=0:ts:1;
    mt= 2*freq*sinc(2*freq*(t));
    mht=hilbert(mt);
    
    x_t=mt+1j*mht;
    len=length(x_t);
    freqaxis=linspace(-fs/2, fs/2, len);
    x_f=fft(x_t,len)/fs;
    
    figure(1)
    
    hold all  %%% keeps the previous plots and everytime changes the color
    subplot(2,1,1), plot(t+T,real(x_t),t+T , imag(x_t));
    xlabel('Time')
    ylabel('Amplitude')
    grid on
   
    hold on     %%% keeps the previous plots 
    subplot(2,1,2), plot(freqaxis,fftshift(abs(x_f)))
      xlabel('Frequency (Hz)')
    ylabel('Magnitude')
    grid on
    %pause(2)  %%%%% pauses for 2 seconds and then go for next loop increment.
end