function [zero,res,niter] = secant(fun, x0, x1, ...
tol, nmax, varargin)

x = x1; 
fx0 = fun(x0, varargin{:});
fx1 = fun(x1, varargin{:});
niter = 1; 
diff = tol +1;

while diff >= tol && niter < nmax && abs(x1 - x0) >= eps 
niter = niter + 1; 

diff = -1 * fx1 * ((x1 - x0) / (fx1 - fx0));
x = x + diff ; 
diff = abs( diff );
fx0 = fx1;
fx1 = fun(x, varargin{:});
x0 = x1;
x1 = x;
end
if (niter == nmax && diff > tol)
fprintf ([ 'Secant stopped without converging to ' ,...
' the desired tolerance because the maximum \n ' ,...
'number of iterations was reached \n']);
end
zero = x; res = fx1;
end