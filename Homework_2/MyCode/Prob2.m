# addpath("/home/ana/Documents/CoursesGaTech/Fall2011/ECE6550/Homework_2/code");
printf("Loading Prob2 \n");

function prob2(t)

A = [ 5,4,2,1; 0,1,-1,-1; -1,-1,3,0; 1,1,-1,2 ];
Pinv = [ -1,1,1,1; 1,-1,0,0; 0,0,-1,0; 0,1,1,0 ];
P = inverse(Pinv);
Jcf = P*A*Pinv;

% Finding e^{At}
Jt = [ exp(1*t), 0, 0, 0; 0, exp(2*t), 0, 0; 0, 0, exp(4*t), t*exp(4*t); 0,0,0,exp(4*t) ];
eAt = Pinv*Jt*P;

disp("P: \n"); P
disp("inv(P): \n"); Pinv
disp("Jordan canonical form: \n"); Jcf


printf("For t: %d eAt is: \n", t);
eAt

printf("Just to compare, using the octave function, eAt is: \n");
expm(A*t)

endfunction
