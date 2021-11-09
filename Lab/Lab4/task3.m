clear all
close all
N=2;
fm=100;
fs=150;
f_max=10;
f_min=100;
t=[-29:1/fs:29];
f1 = randi([10 100],1,1);
f2 = randi([10 100],1,1);
m1_t = N*cos(2*pi*f1*t) + N*cos(2*pi*f2*t);

ht=100*sinc(100*t);

y_t=conv(m1_t, ht, 'same');


len=length(y_t);
freqaxis=linspace(-fs/2, fs/2, len);
y_f= fft(y_t,len)/fs;

subplot(2,1,1), plot(t,y_t);
xlabel('time')
ylabel('amplitude')

subplot(2,1,2), plot(freqaxis,fftshift(abs(y_f)))
xlabel('frequency (Hz)')
ylabel('Magnitude')