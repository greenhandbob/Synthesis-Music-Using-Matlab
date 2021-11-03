function env=envelope(fs,rhythm,A,D,S,op1,op2,op3)

t = linspace(0, rhythm, fs*rhythm);
env=interp1([0 A*rhythm D*rhythm S*rhythm rhythm], [0 op1 op2 op3 0], t,'pchip');

%A defines the location between attack and decay using percentage;
%D defines the location between decay and sustain using percentage;
%S defines the location between sustain and release using percentage;
%op1, op2, op3 defines the point of A D and S ranging from 0 to 1
%respectively

%figure();
%plot(t,env);
%title(' ADSR Envelope')
%xlabel('t')
