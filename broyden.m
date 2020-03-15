function [x, res, niter, err, B]= broyden(Ffun, B0, ...
x0, tol, nmax, varargin)

% x = x0;
% niter = 0; 
% B = eye(n, n);
% F = fun_newtonsys_1(x);
% % One Broyden iteration
% delta = -B\F;
% x = x + delta;
% F = fun_newtonsys_1(x);
% B = B + (F*delta')/(delta'*delta);
% err = norm(delta);
% niter = niter + 1;

niter = 0; err = tol + 1;
x = x0; B = B0; F = Ffun(x,varargin{:});
while err >= tol && niter < nmax

delta = -B\F;
x = x + delta;
%F = fun_newtonsys(x, varargin{:}); newtonsys
%F = newtonsys(F, B, x, tol, nmax, varargin{:}); 
%F = fu(x, varargin{:});
%F = fun_Qp(x, varargin{:});
F =  Ffun(x,varargin{:});
B = B + (F*delta')/(delta'*delta);
err = norm(delta);
niter = niter + 1;

end
res = norm(Ffun(x,varargin{:}));
if (niter==nmax && err> tol)
%     fprintf([' Broyden Fails to converge within maximum ',...
%         'number of iterations.\n',...
%         'The iterate returned has relative ',...
%         'residual %e\n'],res);
else
%     fprintf(['The method converged at iteration ',...
%         '%i with residual %e\n'],niter,res);
end
return