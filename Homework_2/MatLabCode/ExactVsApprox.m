A=[-1,1;0,-1]; B=[1;0]; C=[0,1];

%%%%%%%%%%%%%%%%%%%%%
%% Test your solution for different delta values
delta=0.1;
%%%%%%%%%%%%%%%%%%%%%

Aapprox=eye(2)+delta.*A;
Bapprox=delta.*B;

%%%%%%%%%%%%%%%%%%%%%
%% Insert your Ahat and Bhat here
Ahat=????;
Bhat=????;
%%%%%%%%%%%%%%%%%%%%%

x0=[0.1;0.1];

xapprox=x0;
xexact=x0;

Yapprox=[]; Yexact=[];

k=0;
N=100;

while (k<=N);
    Yapprox=[Yapprox;C*xapprox];
    Yexact=[Yexact;C*xexact];
    
    u=exp(-k*delta);
    
    xapprox=Aapprox*xapprox+Bapprox*u;
    xexact=Ahat*xexact+Bhat*u;
    
    k=k+1;
end;

hold off;
plot(Yapprox,'b');
hold on;
plot(Yexact,'r');
xlabel('t'); ylabel('y');
title('Exact vs. Approximate Discretizations');

    