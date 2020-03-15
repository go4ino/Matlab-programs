function [zero,res,niter]=stefensen(fun,x0,tol, nmax,varargin)

x = x0; fx = fun(x,varargin{:});
gx = (fun((x + fx),varargin{:}) - fx) / fx;

niter = 0; diff = tol+1;
while diff >= tol & niter < nmax
   niter = niter + 1;      diff = - fx/gx;
   x = x + diff;           diff = abs(diff);
   fx = fun(x,varargin{:});
   gx = (fun((x + fx),varargin{:}) - fx) / fx;
end
if (niter==nmax & diff > tol)
    fprintf(['stefensens stopped without converging to',...
    ' the desired tolerance because the maximum\n ',...
    'number of iterations was reached\n']);
end
zero = x; res = fx;


end