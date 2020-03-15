function H = IntPoly_Herm(z, x, y, yd, d_order)
format long e
H_info = pchip(x, y);

if d_order == 0 %base case
    H = ppval(H_info, z);


else %1st deriv
    Hd_info = pchip(x, yd);
    H = ppval(Hd_info, z);
end

end