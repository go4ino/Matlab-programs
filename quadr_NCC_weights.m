function w = quadr_NCC_weights(a, b, n)
%a, b are end points
%from lecture notes chapter 4, slide 20
% closed newton cotes
% http://mathworld.wolfram.com/Newton-CotesFormulas.html 
% formulas ^

cn = zeros(1, n+1);



if n == 1
    cn(1) = 1/2; cn(2) = cn(1);
elseif n == 2
    cn(1) = 1/6; cn(2) = 4/6; cn(3) = cn(1);
elseif n == 3
    cn(1) = 1/8; cn(2) = 3/8; cn(3) = cn(2); cn(4) = cn(1);
elseif n == 4
    cn(1) = 7/90; cn(2) = 16/45; cn(3) = 2/15;
    cn(4) = cn(2); cn(5) = cn(1);
elseif n == 5
    frac = 5/288;
    cn(1) = frac * 19; cn(6) = frac * 19;
    cn(2) = frac * 75; cn(5) = frac * 75;
    cn(3) = frac * 50; cn(4) = frac * 50;
%     pi_n_t = 
%     for k = 1:n
%         
%         cn(k) = ((-1).^(n-k)) / (n*factorial(n-k)* factorial(k)) * 
%     end
elseif n == 6
    frac = 1/140;
    cn(1) = 41 * frac; cn(7) = frac * 41;
    cn(2) =  216 * frac; cn(6) = frac * 216;
    cn(3) = frac * 27; cn(5) = 27 * frac;
    cn(4) = frac * 272;
    
end
w = (b-a)*cn;
end