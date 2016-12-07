%troba la antiimatge de la funcio s per a un resultat x, inicialitzant el
%metode de Newton a x0
function res = resol(x, x0, m)
    f = @(t) s(t, m) - x;
    res = newton(x0, f, @(t) numericalDerivative(f, t));
end