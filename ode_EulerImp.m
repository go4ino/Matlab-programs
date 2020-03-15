function [t, u]=ode_EulerImp(odefun, tspan, y0, Nh, varargin)
% improved Euler method
% slide 18 of chp 8 notes

% Inputs: odefun is the Matlab function for f(t; y), tspan is for I = [t0; T], y0
% is y0, Nh means cut [t0; T] into Nh subintervals, varargin is for parameters to
% be passed to odefun.
% Outputs: Column array t contains a sequence of time: t0 < t1 < t2 < · · · < tN.
% Array u contains a sequence of u. The transpose of its n-th row is the vector
% un; n = 0; 1; 2; · · · ; N and hopefully un ? y(tn) =? is a good approxmation.
% [t, u(:, i)] provides a data table for the i-th unknown function yi(t) =???.
% Remark: Correctly programming the function f(t; y) in an IVP is critical to use
% an ODE solver successfully.


c2 = 1; a21 = 1; b1 = 1/2; b2 = 1/2; %parameters for the RK method
h=(tspan(2)-tspan(1))/Nh;
t=(linspace(tspan(1),tspan(2),Nh+1))'; % equispaced t
u = zeros(Nh + 1, length(y0));
u(1, :) = y0(:)'; u_tmp = y0(:); % always creates a column vector
for n = 1:Nh
K1 = odefun(t(n), u_tmp, varargin{:});
K2 = odefun(t(n) + c2*h, u_tmp + h*a21*K1, varargin{:});
u_tmp = u_tmp + h*(b1*K1 + b2*K2);
u(n+1, :) = u_tmp.'; % (n+1)-th row contains solution at t(n)
end