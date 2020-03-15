function int_val = quadr_comp_trap_f_vec_t_vec(f_vec, t)
%chp 8 slides slide 67
% handy for calculating integrals involving y(t) or its derivatives
int_val = 0;
for i = 1:length(t)-1
int_val = int_val + ((t(i+1) - t(i))/2)*(f_vec(i) + f_vec(i+1));
end