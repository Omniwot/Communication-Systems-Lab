clear all; close all; clc;
f1 = 440;
f2 = 480;
time = 6;
sample_rate = 1000;
t = linspace(0,6,time*sample_rate);
A = 0.1;
y = A*(sin(2 * pi * f1 * t) + sin(2 * pi * f2 * t));
s = square(t,33);
s=s+1;
s=s./2;
sound_wave = s.*y;
plot(t,sound_wave)
sound(sound_wave,sample_rate)