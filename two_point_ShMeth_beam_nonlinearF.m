function F = two_point_ShMeth_beam_nonlinearF(y, f_fun, a, b, ...
b1, b2, b3, b4, Nh, varargin)
% test 2 q5c
% based off of two_point_ShMeth_F.m
% y: [y1; y2]
% f_fun: 
% a, b: end points
% b1, b2, b3, b4: initial conditions for IVP from 5b
% Nh: for ode_rk33

% F(y)  [f1(y1, y2)] = [u(b) - b3]
%       [f2(y1, y2)] = [u'(b)- b4]
% y = [y1; y2]
F = zeros(2,1);
y1 = y(1); y2 = y(2);
xspan = [a,b];

w0 = [b1; b2; y1; y2];
%w0 = [b1; b2;b3;b4];
% w0 = [b1; y1; b2; y2];

%f_fun = @(x, u, ud, udd, uddd) 32.*cos(x) .* sin(x) - 2.* cos(cos(2.*x)) .* sin(cos(2 .* x)) + sin(ud);
% G = @(x, w) [w(2); w(3); w(4); - f_fun(x, w(1), w(2), w(3), w(4))];
% [x,w] = ode_rk33(G, xspan, w0, Nh);
% 
% u_x = w(:, 1); u_dx = w(:, 2); %get our u(x) functions
% u_ddx = w(:, 3); u_dddx = w(:, 4); %get our u(x) functions

[x,w] = ode_rk33(@AAAtest2_q5_fun, xspan, w0, Nh, f_fun);
u_x = w(:, 1); u_dx = w(:, 2); %get our u(x) functions
u_ddx = w(:, 3); u_dddx = w(:, 4); %get our u(x) functions

% plot(x,u_x)
% title('5c method x vs u(x) test')

% w1'(t) = w2(t)
% w2'(t) = w3(t)
% w3'(t) = w4(t)
% w4'(t) = f_fun


F(1) = u_x(end) - b3;
F(2) = u_dx(end) - b4;


end