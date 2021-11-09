roc=280/(10^3);
ac=0.0969/(10^12);
Lo=587.3/(10^9);
Linf=426/(10^9);
b=1.385;
fm=745900;
Cinf=50/(10^12);
Co=0;
ce=1;
go=0;
ge=1;
f=4000000000;  % this has to be changed for each graph
R=sqrt(sqrt((roc^4)+ac*(f^2)));
L=(Lo+Linf*((f/fm)^b))/(1+(f/fm)^b);
C=Cinf+Co*(f^(-ce));
G=go*f^ge;
w=2*pi*f;
gama=sqrt((R+1j*w*L)*(G+1j*w*C));
%H=exp(1)^(gama*d);
%H_mod=abs(H);
H_loop=[];
d_start=10;
d_end=5000;
for d=d_start:500:d_end
    H=(exp(1))^(-1*gama*d);
    H_mod_db=10*log10((abs(H)));
    H_loop=[H_loop H_mod_db];
end
hold all
title('Graph for frequency = 4MHz'); %this has to change with f for each graph
xlabel('Distance (in m)');
ylabel('Channel Gain (in dB)');
d_axis=d_start:500:d_end;
plot(d_axis,H_loop)



