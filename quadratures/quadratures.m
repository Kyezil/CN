function [ress, errs] = integral_newton(f, a, b, sol)
  errs = [];
  for n=1:14
    x = linspace(a, b, n);
    w = pesosNewton(a, b, x);
    res = f(x)*w;
    ress(end + 1) = res;
    er = abs(res - sol)/sol;
    errs(end+1) = er;
  end
end

function [ress, errs] = integral_gauss(f, a, b, sol)
  canv = @(x) (a + b)/2 .+ x.*(b-a)/2;
  errs = [];
  ress = [];
  for n=1:14
    [x, w] = QuadraturaGauss(n);
    res = w*f(canv(x))*(b - a)/2;
    ress(end + 1) = res;
    er = abs(res - sol)/sol;
    errs(end+1) = er;
  end
  plot(1:length(errs), log(errs));
end

function [ress, errs] = integral_newton_open(f, a, b, sol)
  errs = [];
  for n=1:14
    x = linspace(a, b, n+2)(2:end-1);
    w = pesosNewton(a, b, x);
    res = f(x)*w;
    ress(end + 1) = res;
    er = abs(res - sol)/sol;
    errs(end+1) = er;
  end
end

function cas1()
  a = 0; b = 5;
  f = @(x) exp(-x) + 0.5*exp(-(x - 4).^2);
  sol = exp(-a) - exp(-b) + (sqrt(pi)/4)*(erf(b - 4) - erf(a - 4));
  [res1, errs1] = integral_newton(f, a, b, sol);
  [res2, errs2] = integral_gauss(f, a, b, sol);
  plot(log(1:length(errs1)), log(errs1), log(1:length(errs2)), log(errs2));
  legend('newton', 'gauss');
end

function cas2()
  a = -4; b = 4;
  f = @(x) (1 + x.^2).^(-1);
  sol = 2*atan(4);
  [res1, errs1] = integral_newton(f, a, b, sol);
  [res2, errs2] = integral_gauss(f, a, b, sol);
  plot(log(1:length(errs1)), log(errs1), log(1:length(errs2)), log(errs2));
  legend('newton', 'gauss');
end

function cas3()
  a = 0; b = pi/2;
  f = @(x) x.*(sin(x)).^(-1);
  sol = quad(f, a, b);
  [res1, errs1] = integral_newton_open(f, a, b, sol);
  [res2, errs2] = integral_gauss(f, a, b, sol);
  plot(log(1:length(errs1)), log(errs1), log(1:length(errs2)), log(errs2));
  legend('newton', 'gauss');
end