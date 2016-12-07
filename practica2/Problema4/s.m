%calcul del parametre arc amb quadratura de Simpson composta amb m
%intervals
function res = s(t, m)
    load corba;
    f = @(x) sqrt(sum(dgamma(x).^2, 2));
    res = integral_composta_simpson(f, a, t, m); 
end