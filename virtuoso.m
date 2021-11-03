function [ct,cn,ci]=virtuoso()
[y,fs]=audioread("do.mp3");
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
cn=[];
ct=[];
ci=[];
for j=1:500            % num of feature poin you want to find
    [h,i]=max(zAbsT);
    zAbsT(i)=0;
    cn=[cn zAng(i)];
    ct=[ct f(i)];     
    ci=[ci,h];        %intensity,sqrt needed
    m=[];
    
    if j>=2
        for k=1:length(ct)-1
            m(k)=ct(k)-f(i);
        end
        if min(abs(m))<100  %setting interval between frequenciese
            cn(length(cn))=[];
            ct(length(ct))=[];
            ci(length(ci))=[];            
        end
    end 
end

%subplot(2,1,1);
%plot(f,zAbs);
%xlabel('frequency')
%ylabel('Intensity')
%title('Frequency Analysis')
%axis([0 4000 0 1000])
%subplot(2,1,2);
%stem(ct, cn);
%xlabel('frequency')
%ylabel('angle')
%title('Phase Analysis')
%axis([0 4000 -pi pi])

