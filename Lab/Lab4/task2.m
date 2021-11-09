clear all
close all
duration_signal=29;

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
  
   fs=4*freq;
    ts=1/fs;
     t=0:ts:1;
    
         i=randi(3);
     display(i)
    m1_t=cos(2*pi*freq*t); 
    m2_t=2*freq*sinc(2*freq*pi*t);
    m3_t=rectangularPulse(-freq/2,freq/2,t);
    m4_t=audioread("sample.wav");
    switch i
        case 1
            m_t=m1_t
        case 2
            m_t=m2_t
        case 3
            m_t=m3_t
        case 4
            m_t=m4_t
    end
  N=length(m_t);
  m_f= fft(m_t,N)/fs;
  freqaxis=linspace(-fs/2, fs/2, N);
    figure(1)
    
    hold all  %%% keeps the previous plots and everytime changes the color
    
    subplot(2,1,1), plot(t+T,m_t);
    xlim([0 30]);
    xlabel('Time')
    ylabel('Amplitude')
    grid on
    axis([0  inf -5 5])   %%% first two are limits for x-axis, the other two are limits for y-axis: observe why 0 inf , and -5 5 are used here.
    hold on     %%% keeps the previous plots 
    subplot(2,1,2), plot(freqaxis,fftshift(abs(m_f)))
      xlabel('Frequency (Hz)')
    ylabel('Magnitude')
    grid on
    axis([-inf inf 0 3])  %%% first two are limits for x-axis, the other two are limits for y-axis: observe why -inf inf , and 0 3 are used here. 
     
   
      
    %pause(2)  %%%%% pauses for 2 seconds and then go for next loop increment.
end