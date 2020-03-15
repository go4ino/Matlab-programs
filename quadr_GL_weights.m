function w = quadr_GL_weights(a, b, n)
% from lecture 4 slides, slide #38
% on general interval [a b]
bw = quadr_GL_weights_ref(n);
w = ((b-a)/2)*bw;
return;