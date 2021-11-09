N=2;
B=5+N;
fm=B;
fs = 7*fm;
t_start=0;
t_end=3;
t = [-3:1/fs:3];
mt= 2*B*sinc(2*B*t); 
subplot(2,1,1); stem(t,mt)
subplot(2,1,2); plot(t,mt)
