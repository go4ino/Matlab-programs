function p = IntPoly(t, x, y)
degree = length(x) - 1;
coef = polyfit(x, y, degree); p = polyval(coef, t);
end