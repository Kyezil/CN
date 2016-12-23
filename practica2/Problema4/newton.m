function sol = newton(x0, f, df)
  % usa el metode de newton per trobar un zero usant x d'aprox inicial
  % [IN] x0     aproximacio inicial de la solucio
  % [IN] f      funcio que evalua f
  % [IN] df     funcio que evalua la derivada de f
  sol = x0;
  for k = 1:100
    x1 = x0 - f(x0)/df(x0);
    r = abs((x0 - x1)/x1);
    sol = x1;
    if (r < 1e-10)
      break;
    end
    x0 = x1;
    end
end