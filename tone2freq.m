function freq = tone2freq(tone, scale, noctave, rising)
%tone: input of note, ranging from 1 to 7
%noctave: change of the octave, 1 for higher octave -1 for lower octave, 0
%in default
%rising: 1 for sharps and -1 for flats, 0 in default
%freq: output frequency
if (noctave >0 )
    noc = 2;
else
    if (noctave < 0 )
        noc = 1/2;
    else
        noc = 1;
    end
end

if (rising >0)
    r=1;
else
    if (rising <0)
        r=-1;
    else
        r=0;
    end
end

if (tone >3 )
    half=5+2*(tone-4)+r;
else
    half=2*(tone-1)+r;    
end

main = 0;
switch (scale)
    case 1
        main=261.5;
    case 2
        main=293.5;
    case 3
        main=329.5;        
    case 4
        main=349;       
    case 5
        main=391.5;
    case 6
        main=440;
    case 7
        main=494;
end

if tone ==0
    freq=0;
else
    freq = noc*main*2^(half/12);
end

end