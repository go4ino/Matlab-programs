function F = two_point_nonlinear_F_with_dy(u, x, q_fun, r_fun, f_fun, alpha, beta)
% modfied version of chp 9 slide 15 two_point_nonlinear_F.m
% test 2 q 6
% accounts for a y'(x)
% u: nodes to evaluate at???
% x: range of x-val?
% q_fun: q(x,y)*y part
% r_fun: r(x,y) * y' part
% f_fun: f(x,y) part
% alpha: y(a) = alpha cond
% beta: y(b) = beta cond
N = length(u); F = zeros(size(u));
h = x(2) - x(1); % assuming equispaced nodes
F(1) = u(1) - alpha;
for i = 2:N-1
F(i) = -u(i-1) + (2 + h^2*q_fun(x(i), u(i)))*u(i) - u(i+1) ...
+ - h^2*f_fun(x(i), u(i));
end
F(N) = u(N) - beta;