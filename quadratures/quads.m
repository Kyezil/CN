% [res, err] = q(a,b) fa integral de f entre a i b
function [res, err] = integral_composta(q, a, b, m)
  x = linspace(a,b,m+1);
  res = 0; err = 0;
  for i = 1:length(x)-1
    [res_i, err_i] = q(x(i), x(i+1));
    res += res_i; err += err_i;
  end
end

function [res, err] = integral_newton(f, a, b, n, sol)
  x = linspace(a, b, n);
  w = pesosNewton(a, b, x);
  res = f(x)*w;
  err = abs(res - sol);
end

function [res, err] = integral_gauss(f, a, b, n, sol)
  canv = @(x) (a + b)/2 .+ x.*(b-a)/2;
  [x, w] = QuadraturaGauss(n);
  res = w*f(canv(x))*(b - a)/2;
  err = abs(res - sol);
end

function [res, err] = integral_newton_open(f, a, b, n, sol)
    x = linspace(a, b, n+2)(2:end-1);
    w = pesosNewton(a, b, x);
    res = f(x)*w;
    err = abs(res - sol);
end

function cas1()
  a = 0; b = 5;
  f = @(x) exp(-x) + 0.5*exp(-(x - 4).^2);
  sol = exp(-a) - exp(-b) + (sqrt(pi)/4)*(erf(b - 4) - erf(a - 4));
  errs = []; ress = [];
  for n = 1:14
    [res1, err1] = integral_newton(f, a, b, n, sol);
    errs(1, end+1) = err1; ress(1, end+1) = res1; 
    [res2, err2] = integral_gauss(f, a, b, n, sol);
    errs(2, end) = err2; ress(2, end) = res2;
    res2
  end
  plot(log(1:length(errs)), log(errs'));
  legend('newton', 'gauss');
end

function cas2()
  a = -4; b = 4;
  f = @(x) (1 + x.^2).^(-1);
  sol = 2*atan(4);
  errs = []; ress = [];
  for n = 1:14
    [res1, err1] = integral_newton(f, a, b, n, sol);
    errs(1, end+1) = err1; ress(1, end+1) = res1; 
    [res2, err2] = integral_gauss(f, a, b, n, sol);
    errs(2, end) = err2; ress(2, end) = res2; 
  end
  plot(log(1:length(errs)), log(errs'));
  legend('newton', 'gauss');
end

function cas3()
  a = 0; b = pi/2;
  f = @(x) x.*(sin(x)).^(-1);
  sol = quad(f, a, b);
  errs = []; ress = [];
  for n = 1:14
    [res1, err1] = integral_newton_open(f, a, b, n, sol);
    errs(1, end+1) = err1; ress(1, end+1) = res1; 
    [res2, err2] = integral_gauss(f, a, b, n, sol);
    errs(2, end) = err2; ress(2, end) = res2; 
  end
  plot(log(1:length(errs)), log(errs'));
  legend('newton', 'gauss');
end