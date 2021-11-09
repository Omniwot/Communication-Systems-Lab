clear all;close all;clc;

N = 12;
fc = 1000;
fs = 4*fc;
mu = 0;sigma = sqrt(0.01);
duration_signal = 29;amp_carrier = 2;
BW_lpf = 1.5*N;BW_chanl = 0.5*N;

for T = 0:duration_signal
    t = -0.5:1/fs:0.5;
    
    m1t = cos(2*pi*N*t);
    m2t = 2*N*sinc(2*N*t);
    m3t = 200*(cos(200*pi*t)./(1-40000*t.*t)).*sinc(200*t);
    noise = mu + sigma*randn(1,length(t));
    chanl = 2*BW_chanl*sinc(2*BW_chanl*t).*(2*cos(2*pi*fc*t));
    carrier = amp_carrier*cos(2*pi*fc*t);
    
    signals = {m1t;m2t;m3t}; take = randi(3);
    m_t = cell2mat(signals(take));
    modulated = (m_t + 44).*carrier;
    modulated = modulated + noise;
    modulated = conv(modulated,chanl,'same');
    demodulated = hilbert(modulated).*exp(-1i*2*pi*fc*t);
    
    % Modulated signal plot
    nfft = length(modulated);m_f = fft(modulated,nfft)/fs;
    freqaxis = linspace(-fs/2, fs/2, nfft);
    
    figure(1);hold all ;
    subplot(2,1,1), plot(t+0.5+T,modulated);
    title('Modulated Signal');xlabel('Time(sec)');
    ylabel('Amplitude(volts)');grid on;hold on;    
    subplot(2,1,2), plot(freqaxis,fftshift(abs(m_f)));
    xlabel('Freq(Hz)');ylabel('Magnitude');grid on;
    
    % Demodulated signal plot
    nfft = length(demodulated);
    m_f = fft(demodulated,nfft)/fs;
    freqaxis = linspace(-fs/2, fs/2, nfft);
  
    figure(2);hold all ;subplot(2,1,1), plot(t+0.5+T,demodulated);
    title('Demodulated signal');xlabel('Time(sec)');ylabel('Amplitude(volts)');
    grid on;hold on;subplot(2,1,2), plot(freqaxis,fftshift(abs(m_f)));
    xlabel('Freq(Hz)');ylabel('Magnitude');grid on;
    pause(0.5);
end