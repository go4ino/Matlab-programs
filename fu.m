function f = fu(u, g, h)

% u is a vector length = N
% g is a vector length = N
% h is an integer = 1 / (N+1)

% create our vector

if (isa(u, 'cell')) %if u is a cell array of func
f = cell(length(g), 1);
f{1,1} = @(x) -2 * x + x + h.^2 * x.^2 - h.^2 * g(1);
f{length(g), 1} = @(y) y - 2 *  y + h.^2 *  y - h.^2 * g(length(u));


for c = 2:(length(g)-1) %get the 2 through N-1 terms
f{c,1} = @(u) u - 2 * u + u + h.^2 * u.^2 - h.^2 * g(c);
 
end
else %if normal array
    f = zeros(length(u), 1);
f(1) = -2 * u(1,1) + u(2,1) + h.^2 * u(1,1).^2 - h.^2 * g(1);
f(length(u)) = u(length(u)-1,1) - 2 *  u(length(u),1) + h.^2 *  u(length(u),1) - h.^2 * g(length(u));


for c = 2:(length(u)-1) %get the 2 through N-1 terms
f(c) = u((c-1)) - 2 * u(c,1) + u((c+1),1) + h.^2 * u(c,1).^2 - h.^2 * g(c);
    
end
end
end