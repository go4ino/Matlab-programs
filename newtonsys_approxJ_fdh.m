function [x, res, niter] = newtonsys_approxJ_fdh(Ffun, ...
x0, h, tol, nmax, varargin)
format long e
niter = 0; err = tol + 1; x = x0;
while err >= tol && niter < nmax
J = approxJ_fdh(Ffun, x0, h, varargin{:}); F = Ffun(x,varargin{:});
delta = - J\F;  x = x + delta; 
err = norm(delta);  niter = niter + 1;
end
res = norm(Ffun(x,varargin{:}));

if (niter==nmax && err> tol)
fprintf([' Fails to converge within maximum ',...
'number of iterations.\n',...
'The iterate returned has relative ',...
'residual %e\n'],res);
else
fprintf(['The method converged at iteration ',...
'%i with residual %e\n'],niter,res);
end
return