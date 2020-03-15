function x = quadr_GL_nodes(a, b, n)
% from slide 38 lecture 4 slides
% on general itnerval a,b
bx = quadr_GL_nodes_ref(n);
x = ((b-a)/2)*bx + (b+a)/2;
return;