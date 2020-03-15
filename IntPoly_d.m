function p = IntPoly_d(t, x, y)

degree = length(x) - 1;
coef = polyfit(x, y, degree); 
coef_d = polyder(coef);
p = polyval(coef_d, t);

end