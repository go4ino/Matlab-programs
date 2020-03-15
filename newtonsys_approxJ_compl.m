function [x, res, niter] = newtonsys_approxJ_compl(Ffun, ...
x0, EPS, tol, nmax, varargin)
format long e
niter = 0; err = tol + 1; x = x0;
while err >= tol && niter < nmax
J = approxJ_compl(Ffun, x0, EPS, varargin{:}); F = Ffun(x,varargin{:});
delta = - J\F;  x = x + delta; 
err = norm(delta);  niter = niter + 1;
end
res = norm(Ffun(x,varargin{:}));
if (niter==nmax && err> tol)
fprintf(['Approxj Fails to converge within maximum ',...
'number of iterations.\n',...
'The iterate returned has relative ',...
'residual %e\n'],res);
else
fprintf(['The approxj method converged at iteration ',...
'%i with residual %e\n'],niter,res);
end
return