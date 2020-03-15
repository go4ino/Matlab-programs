function F = four_point_ShMeth_F(gamma, ode_fun,a, b, ...
 b1, b2, b3, b4, Nh, varargin)
% 4 point shooting method
% test 2 problem 5
% modifcation of chp 9 slide 4
%implemented correctly
% gamma: where to eval at, aka what does it equal at f(gamme)
% ode_fun: ODE function
% a, b: bounds for x
% b1-b4: initial points at end points
% Nh: FOR ODE_RK33

F = zeros(size(gamma));

G = @(x, w) [w(4); -ode_fun(x, w(1), w(2), w(3), w(4), varargin{:})]; %MODIFY THIS LINE TO 5A SYSTEM

xspan = [a, b];
for i = 1:length(gamma)
%w0 = [b1; gamma(i)]; %does this need to be 4 dimensions to account for 4 point?
w0 = [b1; b2; b3; gamma(i)];
[x, w] = ode_rk33(G, xspan, w0, Nh); %causes error
u = w(:, 1); % udx = w(:, 2);
%u''(x) = w(:, 3)
F(i) = u(end) - b3; %our respective f-val
end