function J = approxJ_compl(fun, x, EPS, varargin)
% fun: some function handle
% x: vector
n = length(x); J = zeros(n, n); 
for j = 1:n % form the approximate Jacobian
e = zeros(n,1); e(j) = 1;
J(:, j) = (1/EPS)*imag(fun(x + EPS*sqrt(-1)*e, varargin{:} ) );
end
return