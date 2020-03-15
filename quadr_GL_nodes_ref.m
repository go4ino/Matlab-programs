function x = quadr_GL_nodes_ref(n)
%from slide 34 on chp 4 lecture slides
% the nodes for Gaussian Legendre Quadrature
x = zeros(1, n+1);
if n == 0
x(1) = 0;
elseif n == 1
x(1) = -1/sqrt(3); x(2) = 1/sqrt(3);
elseif n == 2
x(1) = -sqrt(3/5); x(2) = 0; x(3) = sqrt(3/5);
elseif n==3
    x(1) = 1/35 * sqrt(525-70*sqrt(30));
    x(2) = -1/35 * sqrt(525-70*sqrt(30));
    x(3) = 1/35 * sqrt(525 + 70*sqrt(30));
    x(4) = -1/35 * sqrt(525 + 70*sqrt(30));
elseif n==4
    x(1) = 0;
    x(2) = 1/21 * sqrt(245 - 14*sqrt(70));
    x(3) = -1/21 * sqrt(245 - 14*sqrt(70));
    x(4) = 1/21 * sqrt(245 + 14*sqrt(70));
    x(5) = -1/21 * sqrt(245 + 14*sqrt(70));
end

end