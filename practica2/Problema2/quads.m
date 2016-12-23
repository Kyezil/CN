% [res, err] = q(a,b) fa integral de f entre a i b
function [res, err] = integral_composta(q, a, b, m)
  x = linspace(a,b,m+1);
  res = 0; err = 0;
  for i = 1:length(x)-1
    [res_i, err_i] = q(x(i), x(i+1));
    res += res_i; err += err_i;
  end
end

%Quadratura de Newton-Cotes de la funcio f entre a i b amb n punts d'integracio
function [res, err] = integral_newton(f, a, b, n, sol)
  x = linspace(a, b, n);
  w = pesosNewton(a, b, x);
  res = f(x)*w;
  err = abs(res - sol);
end

%Quadratura de Gauss de la funcio f entre a i b amb n punts d'integracio
function [res, err] = integral_gauss(f, a, b, n, sol)
  canv = @(x) (a + b)/2 .+ x.*(b-a)/2;
  [x, w] = QuadraturaGauss(n);
  res = w*f(canv(x))*(b - a)/2;
  err = abs(res - sol);
end

%Quadratura de Newton-Cotes oberta de la funcio f entre a i b amb n punts d'integracio
function [res, err] = integral_newton_open(f, a, b, n, sol)
    x = linspace(a, b, n+2)(2:end-1);
    w = pesosNewton(a, b, x);
    res = f(x)*w;
    err = abs(res - sol);
end