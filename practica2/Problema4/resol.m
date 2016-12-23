%troba la antiimatge de la funcio s per a un resultat x, inicialitzant el
%metode de Newton a x0
function res = resol(x, x0, m, dgamma)
    f = @(t) s(t, m) - x;
    res = newton(x0, f, @(t) norm(dgamma(t)));  %la derivada de la integral
                                                % es l'integrant evaluat
                                                % en t
end