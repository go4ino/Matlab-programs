function J = fu_J(u, g, h)

% u is a vector length = N
% g is a vector length = N
% h is an integer = 1 / (N+1)

% create our vector
% derive wr to u
N = length(g);

if (isa(u, 'cell')) %if u is a cell array of func
    f = cell(N, N);
    f{1,1} = @(x)  -2 + 2 * (h.^2) * x;
    f{1, 2} = 1;
    f{N, N-1} = 1;
    f{N, N} = @(y) -2 + 2 * (h.^2) * y;
    
    for c = 2:(N-1) %get the 2 through N-1 terms
        f{c, c-1} = 1;
        f{c,c} = @(u) -2 + 2 * (h.^2) * u;
        f{c, c+1} = 1;
    end
else %if normal array
    f = zeros(N, N);
    f(1,1) = -2 + 2 * (h.^2) * u(1,1);
    f(1,2) = 1;
    f(N, N-1) = 1;
    f(N, N) = -2 + 2 * (h.^2) * u(N,1);

    for c = 2:(length(u)-1) %get the 2 through N-1 terms
        f(c, c-1) = 1;
        f(c,c) = -2 + 2 * (h.^2) * u(c,1);
        f(c, c+1) = 1;
    end
end
J = f;
end