%% Sol 4- Numerical

%% Simulate the solution
a = 1;
b = 2;
q = 1; r = 2; k = 0.5;

x0 = 1;

t1 = 1; t0 = 0;
dt = 0.001;

% Create containers
X = [];
T = [];
U = [];
P = [];

% First, integrate backwards to find P
t = t1; 
p = k; % p(t1)

while( t >= t0 );
    P = [P, p];
    p = p - dt*( -transpose(a)*p - p*a - q + p*b*inv(r)*transpose(b)*p );
    t = t - dt;
end

% Order P properly
P = fliplr(P);

% Now, integrate forward to find x
x = x0;
t = t0;
i = 1;
while ( t <= t1 );
    T = [T;t];
    X = [X,x];   
    u = -inv(r)*transpose(b)*P(i)*x;
    U=[U,u];

    x = x + dt*(a*x + b*u );
    t = t + dt;
    i++;
end;

% Plots 
figure(4); 
plot(T,X);
ylabel('x'); xlabel('t');title("Numerical sol");

figure(5);
plot(T,U);
ylabel('u'); xlabel('t');title("Numerical sol");

figure(6);
plot(T,P);
ylabel('p'); xlabel('t');title("Numerical sol");
