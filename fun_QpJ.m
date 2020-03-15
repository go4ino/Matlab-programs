function J = fun_QpJ(x, gam, c, z)
format long e
%f = @(d) fun_Qp(d, gam, c, z);

J = zeros(4, 4);

%first row
for i = 1:3
   J(1, i) = 1; 
    
end

%next 3 rows
for i = 2:4
    %derivative of sign(x) = 0 except @ x = 0
    J(i, i - 1) = c(1) * (2 * sign(x(i-1)) * x(i-1));    
    J(i, 4) = 1/gam;
end


%see hw 4 q6
%screw this shit
% syms x1 x2 x3 x4
% f1 = x1 + x2 + x3;
% f2 = x4/gam + c(1) * sign(x1) * (x1).^2 + z(1);
% f3 = x4/gam + c(2) * sign(x2) * (x2).^2 + z(2);
% f4 = x4/gam + c(3) * sign(x3) * (x3).^2 + z(3);
% 
% Jac = jacobian([f1, f2, f3, f4], [x1, x2, x3, x4]);
% [x(1), x(2), x(3), x(4)]

%J = subs(Jac, {x1 x2 x3 x4}, {x(1), x(2), x(3), x(4)});)
%J = double(Jac);
end