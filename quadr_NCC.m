function int_val = quadr_NCC(f_name, a, b, n, varargin)
%I (f ; a; b; n) = sum(w(n,k) * f(x(k))
%f_name is the function we are evaluating with
% a b are boundary points
% n is # of nodes
% from slide 21 in chapter 4 slides

xnodes = quadr_NCC_nodes(a, b, n); %the nodes we are to evaluate at
w = quadr_NCC_weights(a, b, n); %will be an array
fx = f_name(xnodes, varargin{:});
int_val = sum(w.*fx);

end