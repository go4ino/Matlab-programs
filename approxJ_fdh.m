function J = approxJ_fdh(fun, x0, h, varargin)
n = length(x0); J = zeros(n, n);
F = fun(x0, varargin{:});
for j = 1:n % form the approximate Jacobian
e = zeros(n,1); e(j) = 1; % form the j-th unit vector
J(:, j) = (fun(x0 + h*e, varargin{:}) - F)/h;
end