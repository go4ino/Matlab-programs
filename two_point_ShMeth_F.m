function F = two_point_ShMeth_F(gamma, ode_fun, a, b, ...
alpha, beta, Nh, varargin)
% 2 point shooting method
% chp 9 slide 4
% implemented correctly
% gamma: where to eval at, aka what does it equal at f(gamme)
% ode_fun: ODE function
% a, b: bounds for x
% alpha:
% beta:
% Nh: FOR ODE_RK33

F = zeros(size(gamma));

G = @(x, w) [w(2); -ode_fun(x, w(1), w(2), varargin{:})]; %MODIFY THIS LINE TO 5A SYSTEM

xspan = [a, b];
for i = 1:length(gamma)
w0 = [alpha; gamma(i)];
[x, w] = ode_rk33(G, xspan, w0, Nh);
u = w(:, 1); % udx = w(:, 2);
F(i) = u(end) - beta;
end