function f = fun_Qp(x, gam, c, z)
% x(1) = Q1
% x(2) = Q2
% x(3) = Q3
% x(4) = p

f = zeros(4, 1);
%make our system of eq
f(1) = x(1) + x(2) + x(3);
f(2) = x(4)/gam + c(1) * sign(x(1)) * (x(1)).^2 + z(1);
f(3) = x(4)/gam + c(2) * sign(x(2)) * (x(2)).^2 + z(2);
f(4) = x(4)/gam + c(3) * sign(x(3)) * (x(3)).^2 + z(3);

end