function [cti,cni,cii]=virtuosoi()

[y,fs]=audioread("doi.mp3");
fs1=20000;
z=resample(y,fs1,fs);             %resample to frequency we use.
zFft=fft(z,length(z));          
zAbs=abs(zFft);
zAbs(7196:length(zFft))=0;
zAbsT=zAbs';
zAng=angle(zFft);

n=0:length(z)-1;
t=n/fs1;
f=n*fs1/length(z);

cni=[];
cti=[];
cii=[];
for j=1:500
    [h,i]=max(zAbsT);
    zAbsT(i)=0;
    cni=[cni zAng(i)];
    cti=[cti f(i)];
    cii=[cii,h];
    m=[];
    if j>=2
        for k=1:length(cti)-1
            m(k)=cti(k)-f(i);
        end
        if min(abs(m))<100
            cni(length(cni))=[];
            cti(length(cti))=[];
            cii(length(cii))=[];
        end
    end 
end


%subplot(2,1,1);
%plot(f,zAbs);
%axis([0 4000 0 1000])
%subplot(2,1,2);
%stem(cti, cni);
%axis([0 4000 -pi pi])

