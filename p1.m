clc
clear all
close all
delp=0.001;
dels=0.1;
fs=8000;
fp=1500;
F=500+fp;
N=ceil((-20*log((dels*delp)^(0.5))-13)/(14.6*(F-fp)/fs));
disp(N)
b=fir1(N-1,0.2,'low',rectwin(N));  %filter coeff.(response)
[h,omega]=freqz(b,1,512);
figure
plot(omega/pi,20*log10(abs(h)))