function F = quadr_2D_on_y_fixed(x, integrand, c, d, ...
M, quad_simple, n_s, varargin)
% quadrature on fixed y value double integral
% c,d are the end points of the dy integral
% M: # of subintervals
% quadr_simple_name: quadrature matlab function to call
% n_s: #of local nodes - 1
% chp 4 slide 71
F = zeros(size(x));
for i = 1:length(x)
f_tmp = @(y) integrand(x(i), y, varargin{:});
F(i) = quadr_comp(f_tmp, c, d, M, quad_simple, n_s);
end
return;