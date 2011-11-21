%% Sol 4- Analytical

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

% M
M = [a, -b*inv(r)*transpose(b); -q, -transpose(a)];

x = x0;
t = t0;
while ( t <= t1 )

  T = [T;t];
  X = [X,x];   

  eM = expm( M.*(t - t1) );
  xxyy = eM*[1; k];
  xx = xxyy(1);  
  yy = xxyy(2);

  p = yy*inv(xx);
  P = [P,p];

  u = -inv(r)*transpose(b)*p*x;
  U=[U,u];
  x = x + dt*(a*x + b*u); 
  t = t + dt;
 
end

% Plots 
figure(1); 
plot(T,X,'linewidth', 4 );
grid on;
ylabel('x'); xlabel('t'); title("x vs t");
print('Question4X.png', '-dpng');

figure(2);
plot(T,U, 'linewidth', 4 );
grid on;
ylabel('u'); xlabel('t');title("u vs t");
print('Question4U.png', '-dpng');

figure(3);
plot(T,P, 'linewidth', 4 );
grid on;
ylabel('p'); xlabel('t');title("p vs t");
print('Question4P.png', '-dpng');
