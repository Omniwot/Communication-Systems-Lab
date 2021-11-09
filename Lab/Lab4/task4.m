fs=8*freq;

    ts=1/fs;
    t=0:ts:1;
    mt= 2*freq*sinc(2*freq*(t));
    mht=hilbert(mt);
    
    x_t=mt+1j*mht;
    len=length(x_t);
    freqaxis=linspace(-fs/2, fs/2, len);
    x_f=fft(x_t,len)/fs;
    