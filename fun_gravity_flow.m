function f = fun_gravity_flow(theta, v, X, Del_y)
% 1x2 function
% [f1; f2] = [0; 0]
% Del_y = delta y

f = zeros(20,1);

for i = 1:19
    f(i) = (sin(theta(i+1, 1)) / v(i+1,1)) - (sin(theta(i, 1)) / v(i,1));
end
%f(20) = Del_y * symsum(tan(theta(i,1) - X), i, 1, 20);
f_sum = 0;

for i = 1:20
    f_sum = f_sum + (tan(theta(i,1)) - X);
    
end
f(20) = Del_y * f_sum;
end