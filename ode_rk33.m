function [t, u] = ode_rk33(odefun, tspan, y0, Nh, varargin)
% Usage: [t, u] = ode_rk33(odefun, tspan, y0, Nh, varargin)
% chp 8 slide 22
a21=1/2; a31 = -1; a32 = 2;
b1=1/6; b2=2/3; b3=1/6;
c2=1/2; c3=1;
% prepare the nodes:
t = (linspace(tspan(1),tspan(2),Nh+1))'; h = t(2) - t(1);
% generate the numerical solution by the RK method
u = zeros(Nh + 1, length(y0)); 
u(1,:) = (y0(:))' ; %1st row
u_tmp = y0(:);

for n = 1:Nh
K1 = odefun(t(n), u_tmp, varargin{:});
K2 = odefun(t(n) + c2*h, u_tmp + h*a21*K1, varargin{:});
K3 = odefun(t(n) + c3*h, u_tmp + h*(a31*K1+a32*K2), varargin{:});
u_tmp = u_tmp + h*(b1*K1 + b2*K2 + b3*K3);
u(n+1,:) = u_tmp';
end