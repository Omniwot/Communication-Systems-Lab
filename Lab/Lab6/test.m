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
    N=2;
    fm=N;
    fc = 1000;
    fs=10*fc;
    ts=1/fs;
    t=0:ts:1;
    
    i=randi(3);
    display(i)
    m1_t=cos(2*pi*fm*t); 
    m2_t=2*fm*sinc(2*fm*t);
    Nsym = 200; %filter span in symbol durations
    L=10;
    alpha=1;
    t2=-10:ts:10;
    m3_t = 200*(cos(200*pi*t)./(1-40000*t.*t)).*sinc(200*t);

    switch i
        case 1
            m_t=m1_t;
        case 2
            m_t=m2_t;
        case 3
            m_t=m3_t;
    end
 
 Ac = 2;%Amplitude of carrier signal.

carrier = Ac*cos(2*pi*fc*t);%carrier signal.
dsb_sc = m_t.*carrier; %dsb sc modulated wave 
t2=-0.5:ts:0.5;
h_t = 2*100*sinc(2*100*t2);
    y_t = conv(dsb_sc, h_t, 'same');
    n_t = 0.01*randn(size(t));
    
    y_t = y_t + n_t;
    %y_t = dsb_sc + n_t;
 
 %=====DSB SC IN FREQUENCY DOMAIN============
ld=length(dsb_sc);
f=linspace(-fs/2,fs/2,ld);
DSB_SC=fftshift(fft(dsb_sc,ld)/ld); %frequency spectrum of dsb_sc modulated signal.
%=====DSB SC DEMODULATION TIME DOMAIN============
pmo = y_t.*carrier;
pmo = pmo/(Ac*Ac);
t1=-5:ts:5;
lpf=2*fm*sinc(2*fm*t1);
msg_r = conv(pmo, lpf, 'same');
%=====DSB SC DEMODULATION FREQUENCY DOMAIN============
lr=length(msg_r);
fr=linspace(-fs/2,fs/2,lr); %frequency bins
MSG_R=fftshift(fft(msg_r,lr)/lr); %frequency spectrum of demodulated signal
%================ PLOTTING =========================
figure(1)
hold all;
subplot(4,1,1);
plot(t+T, m_t);
title("MESSAGE SIGNAL (TIME DOMAIN)");
xlabel('time (sec)');
ylabel('amplitude');
grid on;
hold on;
subplot(4,1,2);
plot(t+T, carrier);
title("CARRIER SIGNAL (TIME DOMAIN)");
xlabel('time (sec)');
ylabel('amplitude');
grid on;
hold on;
subplot(4,1,3);
plot(t+T, dsb_sc);
title("MODULATED DSB SC SIGNAL (TIME DOMAIN)");
xlabel('time (sec)');
ylabel('amplitude');
grid on;
hold on;
subplot(4,1,4);
plot(t+T, msg_r);
title("DEMODULATED DSB SC SIGNAL (TIME DOMAIN)");
xlabel('time (sec)');
ylabel('amplitude');
grid on;
hold on;
figure(2)
hold all
subplot(2,1,1);
plot(f, abs(DSB_SC));
xlim([-15 15]);
title('DSB SC MODULATION IN FREQUENCY DOMAIN');
xlabel('frequency(hz)');
ylabel('amplitude');
grid on;
hold on;
subplot(2,1,2);
plot(fr, abs(MSG_R));
xlim([-6 6]);
title('DSB SC DE MODULATION IN FREQUENCY DOMAIN');
xlabel('frequency(hz)');
ylabel('amplitude');
grid on;     
    %pause(2)  %%%%% pauses for 2 seconds and then go for next loop increment.
end