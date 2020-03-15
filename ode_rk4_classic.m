function [t, u] = ode_rk4_classic(odefun, tspan, y0, Nh, varargin)
% hw 8 q1 a. pg 300 (315 / 465) in tb
% modified ode_rk33.m
% a(i, j) = 0 for all j >= i, so lower tri matrix

a21=1/2; 
a31 = 0; a32 = 0.5; 
a41 = 0; a42 = 0; a43 = 1;
b1=1/6; b2=1/3; b3 = 1/3; b4=1/6;
c2=1/2; c3=0.5; c4 = 1;

% prepare the nodes:
t = (linspace(tspan(1),tspan(2),Nh+1))'; h = t(2) - t(1);
% generate the numerical solution by the RK method
u = zeros(Nh + 1, length(y0)); u(1,:) = (y0(:))'; u_tmp = y0(:);

for n = 1:Nh
%K1 = odefun(t(n), w, varargin{:});
K1 = odefun(t(n), u_tmp, varargin{:}); %K1 = f(t_n, u_n)
K2 = odefun(t(n) + c2*h, u_tmp + h*a21*K1, varargin{:});
K3 = odefun(t(n) + c3*h, u_tmp + h*(a31*K1+a32*K2), varargin{:});
K4 = odefun(t(n) + c4*h, u_tmp + h*(a41*K1 + a42*K2 + a43*K3), varargin{:});

u_tmp = u_tmp + h*(b1*K1 + b2*K2 + b3*K3 + b4*K4);
u(n+1,:) = u_tmp';
end

end

