t=0:0.0025:5;
fs= 1/0.0025;
x = sin(2*pi*100*t)+sin(2*pi*20*t);
subplot(7,1,1);
plot(x);
y=fft(x,2048);
for i=1:1025;
    z(i)=y(i);
end
disp(y);
subplot(7,1,2);
freq_axis = fs/2*linspace(0,1,1025);
plot(freq_axis,abs(z));
subplot(7,1,3);
X = x + 2*rand(1,2001);
plot(X);
Y = fft(X,2048);
for i=1:1025;
    Z(i)=Y(i);
end
subplot(7,1,4);
plot(freq_axis,abs(Z));
o=5;
wn=[20 100]/(200)
[b,a]=butter(o,wn,'bandpass');
[h,w] = freqz(b,a,1024,fs);
subplot(7,1,5);
plot(w,20*log10(abs(h)));
y_filt = filter(b,a,X);
subplot(7,1,6);
plot(y_filt);
subplot(7,1,7);
Y_filt = fft(X,2048);
for i=1:1025;
    Z_filt(i)=Y_filt(i);
end
plot(freq_axis,abs(Z_filt));