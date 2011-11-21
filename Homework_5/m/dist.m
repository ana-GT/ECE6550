%% These are the system matrices associated with
%% a pretty fancy distillation process

A=[ -10.5234    7.4126         0         0         0;
      9.5234  -16.8957    7.4126         0         0;
           0    9.4831   16.8445    7.4126         0;
           0         0    9.4319   -16.7797    -7.4126;
           0         0         0    9.3672   16.6986];
       
B=[0.1   -0.0099;
   0     -0.0126;
   0     -0.0161;
   0     -0.0204;
   0.31  -0.0257];
       

% First (as always), check for stability and controllability!

% Stability
[co_evect, co_eval] = eig(A);

% Controllability
co = ctrb(A,B);
co_rank = rank(co)


%% LQ Optimal control
%% Update your weights here to get better performance
Q = 1*eye(5); Q(4,4) = 1;
R = eye(2); R(1, 1) = 5;

[P,L,G] = care( A,B, Q, R );
K = G
P
L

[evectk, evalk] = eig(A-B*K);
evectk
evalk
%% If you are using Pole placement
%% this is where you would use it
K2 = place(A,B,fliplr(L));
K2

[evectk2, evalk2] = eig(A-B*K2);
evectk2
evalk2

%% Simulate the solution
tf=1; dt=0.001;
t=0; 
x0=[-1.4;-1.4;0.5;-0.2;-0.2]; 

x = x0;
X=[]; U=[];

x2 = x0; 
X2 = []; U2 = [];

T=[];  

while (t<=tf);
    T=[T;t];
    X=[X,x];
    u=-K*x;
    U=[U,u];
    x=x+dt.*(A*x+B*u);

    X2 = [X2, x2];
    u2 = -K2*x2;
    U2 = [U2, u2];

    x2 = x2 + dt.*(A*x2+B*u2);
    t=t+dt;

end;

 
figure(1); 
plot(T,X, 'linewidth', 4);
grid on;
legend('x1', 'x2','x3', 'x4','x5');
title('x vs t');
ylabel('x'); xlabel('t');
print('Question1x.png', '-dpng');

figure(2); 
plot(T,U, 'linewidth', 4);
grid on;
legend('u1', 'u2');
title('u vs t');
ylabel('u'); xlabel('t');
print('Question1u.png', '-dpng');

figure(3); 
plot(T,X2, 'linewidth', 4);
grid on;
legend('x1', 'x2','x3', 'x4','x5');
title('Pole placement: x vs t');
ylabel('x'); xlabel('t');
print('Question2x.png', '-dpng');

figure(4); 
plot(T,U2, 'linewidth', 4);
grid on;
legend('u1', 'u2');
title('Pole placement: u vs t');
ylabel('u'); xlabel('t');
print('Question2u.png', '-dpng');
