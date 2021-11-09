clc;
fs = 6000;
f1 = 450;
f2 = 550;
t = [0:1/fs:10];
wave1 = sin(2*pi*f1*t);
wave2 = sin(2*pi*f2*t);
output = wave1 + wave2;
plot(output)
sound(output, fs);
