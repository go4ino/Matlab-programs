function [t, u] = ode_CN_Broyden(odefun, tspan, y0, Nh, tol, nmax, varargin)
%chp 9 slide 32
% ODE solver that uses broyden's method

bm1 = 1/2; b0 = 1/2;
t = linspace(tspan(1),tspan(2),Nh+1); tau = t(2) - t(1);
u = zeros(Nh + 1, length(y0)); u(1,:) = y0;
for n = 1:Nh
vn = u(n,:)' + tau*b0*odefun(t(n), u(n,:)', varargin{:});
G = @(z) z - tau*bm1*odefun(t(n+1), z, varargin{:}) - vn;
B0 = approxJ_compl(G, u(n,:)', 10^(-5));
z0 = u(n,:)' + tau*odefun(t(n), u(n,:)', varargin{:});
%[z, res, niter, B0] = broyden_TL(G, B0, z0, tol, nmax);
[z, res, niter, B0] = broyden(G, B0, z0, tol, nmax);

u(n+1, :) = z'; % a matrix of our solution
end
t = t'; % to make t a column vector
return;