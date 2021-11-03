function waves = gen_wave(tone, scale, noctave, rising, rhythm, fs)
%rhythm:duration time of single tone. The unit is in seconds.
%fs: sampling frequency
freq = tone2freq(tone, scale, noctave, rising);
t = linspace(0, rhythm, fs*rhythm);
%y = sin(2*pi*freq*t);

%m1=y.*exp(-t/(rhythm));
%m2=y.*((length(t)-t)/rhythm);
%m3=y.*((length(t)-t)/rhythm).^2;

%subplot(4,1,1);
%plot(t,y);
%title('Original Sound Wave');
%subplot(4,1,2);
%plot(t,m2);
%title('Linear Attenuation');
%subplot(4,1,3);
%plot(t,m3);
%title('Square Attenuation');
%subplot(4,1,4);
%plot(t,m1);
%title('Exponential Decay');

[ct,cn,ci]=virtuoso();
[cti,cni,cii]=virtuosoi();
y=zeros(1,length(t));
ctd=[];
cnd=[];
cid=[];

if noctave == 1
    ctd=cti;
    cnd=cni;
    cid=cii;
else
    ctd=ct;
    cnd=cn;
    cid=ci;
end

if tone==0
    y = sin(2*pi*freq*t);
else
    for i=1:length(ctd)
        y=y+sqrt(cid(i))*sin(2*pi*freq*t*(ctd(i)/ctd(1))+cnd(i));
    end
end

env=envelope(fs,rhythm,0.05,0.2,0.7,0.6,0.3,0.2);
y=y.*env;


%plot(t,y);
%sound(y,fs)
%pause(rhythm);
waves=y;
end