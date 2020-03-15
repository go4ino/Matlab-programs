function [t, u]=ode_EulerMod(odefun, tspan, y0, Nh, varargin)
%modified ode_EulerImp.m
% chp 8 slide 20

c2 = 1; a21 = 1; b1 = 0; b2 = 1; %parameters for the RK method
h=(tspan(2)-tspan(1))/Nh;
t=(linspace(tspan(1),tspan(2),Nh+1))'; % equispaced t
u = zeros(Nh + 1, length(y0));
u(1, :) = y0(:)'; u_tmp = y0(:); % always creates a column vector
for n = 1:Nh
K1 = odefun(t(n), u_tmp, varargin{:});
K2 = odefun(t(n) + c2*h, u_tmp + h*a21*K1, varargin{:});
u_tmp = u_tmp + h*(b1*K1 + b2*K2);
u(n+1, :) = u_tmp.';
end