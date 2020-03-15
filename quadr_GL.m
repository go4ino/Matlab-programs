function int_val = quadr_GL(f_name, a, b, n, varargin)
% based off slide 36 in chp 4 notes

%general boudary [-1 1]
if a == -1 && b == 1
    xnodes = quadr_GL_nodes_ref(n); %the nodes we are to evaluate at
    w = quadr_GL_weights_ref(n); %will be an array
    fx = f_name(xnodes, varargin{:});
    int_val = sum(w.*fx);
% non general [a b]
else
    xnodes = quadr_GL_nodes(a, b, n); %the nodes we are to evaluate at
    w = quadr_GL_weights(a, b, n); %will be an array
    fx = f_name(xnodes, varargin{:});
    int_val = sum(w.*fx);
end

end