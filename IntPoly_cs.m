function S = IntPoly_cs(t, x, y, bdata, conds, d_order)
% t = where we evaluate
% x and y are x and y nodes
% bdata is boundary values
% conds is what derivative we analyze end points @
%d_order = 0, 1, or 2. derivative order we wanna get the value of t at


%slide 68 has info maybe? for the code
%slide 70 baby
d1 = bdata(1); 
d2 = bdata(2); 
y_with_bc = [d1 y d2];
S_info = csape(x, y_with_bc, conds); 
coefs = (S_info.coefs);

if d_order == 0
    S = ppval(S_info, t);
    
elseif d_order == 1 %first derivative
    coefs_d1 = [3*coefs(:, 1), 2*coefs(:, 2), coefs(:, 3)];
    S_d1_info = mkpp(x, coefs_d1); 
    S_d1 = ppval(S_d1_info, t);
    S = S_d1;
else %2nd derivative
    coefs_d2 = [6*coefs(:, 1), 2*coefs(:, 2)];
    S_d2_info = mkpp(x, coefs_d2); 
    S_d2 = ppval(S_d2_info, t);
    S = S_d2;
    
end

end