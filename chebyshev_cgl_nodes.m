function x = chebyshev_cgl_nodes(a, b, n)
% Usage: x = chebyshev_cgl_nodes(a, b, n)
% This code will generate n Chebyshev-Gauss-Lobatto nodes
% over the interval [a, b]
% chp 3 slide  48
I = 0:(n-1); hx_cgl = -cos(pi*I/(n-1));
x_cgl = (a+b)/2 + ((b-a)/2)*hx_cgl;
return;