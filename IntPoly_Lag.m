function p = IntPoly_Lag(t, x, y, d_order)
% evaluate @ t's value
k = 1;
p = 0;
% while (k < length(x) - 1)
for k = 1:length(x)
% loop to do the summation 
p = p + (y(k) * lagrange_char(t, x, k, d_order)); %Lagrange interpolation poly
%p = p + (y(k) * lagrange_char(t, x(1:k), k, d_order)); % no bueno

%k = k + 1;
end

end