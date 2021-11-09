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
    freq=100;
  
   fs=3*freq;
    ts=1/fs;
     t=0:ts:1;
    f1 = randi([10 100],1,1);
    f2 = randi([10 100],1,1);
    N=2;
    m1_t = N*cos(2*pi*f1*t) + N*cos(2*pi*f2*t);
    t1=-5:ts:5;
    ht=100*sinc(100*t1);

    m_t=conv(m1_t, ht, 'same');


     
      
  N=length(m_t);
  m_f= fft(m_t,N)/fs;
  freqaxis=linspace(-fs/2, fs/2, N);
    figure(1)
    
    hold all  %%% keeps the previous plots and everytime changes the color
    subplot(2,1,1), plot(t+T,m_t);
    xlabel('time')
    ylabel('amplitude')
    grid on
    axis([0  inf -5 5])   %%% first two are limits for x-axis, the other two are limits for y-axis: observe why 0 inf , and -5 5 are used here.
    hold on     %%% keeps the previous plots 
    subplot(2,1,2), plot(freqaxis,fftshift(abs(m_f)))
      xlabel('frequency (Hz)')
    ylabel('Magnitude')
    grid on
    axis([-inf inf 0 3])  %%% first two are limits for x-axis, the other two are limits for y-axis: observe why -inf inf , and 0 3 are used here. 
     
   
      
   % pause(2)  %%%%% pauses for 2 seconds and then go for next loop increment.
end