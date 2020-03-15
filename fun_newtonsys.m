function f = fun_newtonsys(x, a1, a2, a3)
n = length(x); 
f = zeros(n, 1);
f(1) = sin(a1 * x(1) * x(2)) - 2 * x(2) - x(1);
f(2) = a2 * (exp(2 * x(1)) - exp(1)) + a3 * (4 * x(2).^2 - 2 * x(1));
return;