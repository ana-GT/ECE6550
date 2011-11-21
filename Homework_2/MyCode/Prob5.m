# addpath("/home/ana/Documents/CoursesGaTech/Fall2011/ECE6550/Homework_2/MyCode");

% Question 5

A=[-1,1; 0,-1]; 
B=[1;0]; 
C=[0,1];

% --------------------------
%% Time step
delta = 0.8;

% --------------------------
% Approximate values
Aapprox=eye(2)+delta.*A;
Bapprox=delta.*B;

% -------------------------------------------------------------
%% Exact values
Ahat = [ exp(-delta), delta*exp(-delta); 0, exp(-delta) ];
Bhat = [ 1 - exp(-delta); 0 ];
% -------------------------------------------------------------

x0=[ 0.1; 0.1 ];

xapprox=x0;
xexact=x0;

Yapprox=[]; Yexact=[];
T = [];

k=0;
N=100;

% ---------------------------------------
% Calculate output Y
ind = false;

while (k <= N);
    Yapprox=[Yapprox;C*xapprox];
    Yexact=[Yexact;C*xexact];
    if abs( (Yapprox(end) - Yexact(end))/Yexact(end) ) > 0.1 && ind == false
      printf("Difference higher than 10 percent in time: %.3f \n", k*delta );  
      ind = true; 
    end

    u=exp(-k*delta);
    
    xapprox=Aapprox*xapprox+Bapprox*u;
    xexact=Ahat*xexact+Bhat*u;
    
    k= k + 1;
end;

% ------------------------------------------
% Plot
figure(1)
hold off;
plot(Yapprox,'b', 'linewidth', 4 );
hold on;
grid on;
plot(Yexact,'r', 'linewidth', 4 );
xlabel('t'); ylabel('y');
legend( 'Approximate Discretization','Exact Discretization', 1 );
title('Exact vs. Approximate Discretizations');
print('Question5Delta08.png', '-dpng');
replot
    
