function int_val = quadr_comp(fun_name, a, b, M, ...
quadr_simple_name, n_s, varargin)
% A Matlab program for general composite formulas:
% fun_name: function input to evaluate
% a,b: end points
% M: # of subintervals
% quadr_simple_name: quadrature matlab function to call
% n_s: #of local nodes - 1
% chp 4 slide 43
x = linspace(a, b, M+1);
int_val = 0;
for i = 1:M
int_val = int_val ...
+ quadr_simple_name(fun_name, x(i), x(i+1), n_s, varargin{:});
end
return;