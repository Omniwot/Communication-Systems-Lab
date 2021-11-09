signal_duration = 29;
for T = 0:signal_duration
    N = 2; %%% Last digit of ID is 2,
    if(T==0)
        disp('Transmission Started')
        disp(T)
    elseif(T==duration_signal) 
        disp('Transmission ends: see the final result')
        disp(T)
    else
        disp('Transmission in progress: please wait')
        disp(T)
    end
    
    f1 = randi([10, 100]);
    f2 = randi([10, 100]);
    fs = 8 * max(f1,f2);
    ts = 1/fs;
    t = -5:ts:5;
    m1_t = N*cos(2*pi*f1*t) + N*cos(2*pi*f2*t);
    B = 50;
    h_t = 2*B*sinc(2*B*t);
    y_t = conv(m1_t, h_t, 'same');
    y_f = fft(y_t)/fs;
    n = length(y_t);
    freq_axis = linspace(-fs/2, fs/2, n);

    figure(1)
    
    subplot(2,1,1)
    hold all;
    plot(t+T, y_t)
    subplot(2,1,2)
    hold all;
    plot(freq_axis, fftshift(abs(y_f)))
    %disp(f1)
    %disp(f2)
end