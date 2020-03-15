function J = fun_newtonsys_J(x, a1, a2, a3)
n = length(x); J = zeros(n, n);
J(1,1) = a1 * x(2)*cos(x(1)*x(2)) - 1; J(1,2) = a1 * x(1)*cos(x(1)*x(2)) - 2;
J(2,1) = 2*a2*exp(2*x(1)) - 2 * a3; J(2,2) = 8 * a3 * x(2);
return;