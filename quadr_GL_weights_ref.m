function w = quadr_GL_weights_ref(n)
%from slide 34 of lecture 4 slides
%gets Gauss legendre quadrature weights
w = zeros(1, n+1);
if n == 0
w(1) = 2;
elseif n == 1
    w(1) = 1; w(2) = 1;
elseif n == 2
    w(1) = 5/9; w(2) = 8/9; w(3) = 5/9;
elseif n == 3
    w(1) = 1/36 * (18 + sqrt(30));
    w(2) = 1/36 * (18 + sqrt(30));
    w(3) = 1/36 * (18 - sqrt(30));
    w(4) = 1/36 * (18 - sqrt(30));
elseif n == 4
    w(1) = 128/225;
    w(2) = (1/900) * (322 + 13*sqrt(70)); w(3) = (1/900) * (322 + 13*sqrt(70));
    w(4) = (1/900) * (322 - 13*sqrt(70)); w(5) = (1/900) * (322 - 13*sqrt(70));
end
end