
%%%% System parameters
n=2; % x in Re^n
m=1; % u in Re^m
p=1; % y in Re^p

% Controllable realization
AC=[0,1;-3,-5];
BC=[0;1];
CC=[1,4];

% Observable realization
AO=[-5,1;-3,0];
BO=[4;1];
CO=[1,0];

A=AC;
B=BC; 
C=CC;

%%%% Initializations
t0=0; t=t0; tf=1;
dt=0.01; % Step size

x0=zeros(n,1); 
%x0=ones(n,1);
x=x0;

%%%% Storage matrices
X=[]; X=[X,x];
Y=[]; y=C*x; Y=[Y,y];
T=[]; T=[T;t];

%%%% Simulate the system
while (t<=tf);
  u=3*sin(0.5*t);               % Control signal
  x=x+dt.*(A*x+B*u);   % Euler approximation
  y=C*x;
  t=t+dt;
  X=[X,x]; Y=[Y,y]; T=[T;t];
end;

figure(1);
%clf;

%%%% Plot the solutions
for i=1:n;
  subplot(n+p,1,i);
  hold on;
  plot(T,X(i,:));
  ylabel('x');
end;
for i=1:p;
  subplot(n+p,1,n+i);
  hold on;
  plot(T,Y(i,:));
  ylabel('y');
end;
xlabel('t');



