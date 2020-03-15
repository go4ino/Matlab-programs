function f = lagrange_char(x, x_nodes, k, d_order)


if(d_order == 0) %get base equation
    x_no_k = [x_nodes(1:k-1), x_nodes(k+1:end)];
coef = poly(x_no_k);
%f = @(x) polyval(coef, x)/polyval(coef, x_nodes(k));
f = polyval(coef, x)/polyval(coef, x_nodes(k));   
elseif d_order == 1 %get the deriviative
x_no_k = [x_nodes(1:k-1), x_nodes(k+1:end)];
coef = poly(x_no_k);
coef_d = polyder(coef/polyval(coef, x_nodes(k)));
%f = @(x) polyval(coef_d, x);
f = polyval(coef_d, x);
end

end