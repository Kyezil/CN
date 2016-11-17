function cas1()
  a = 0; b = 5; n = 4;
  f = @(x) exp(-x) + 0.5*exp(-(x - 4).^2);
  sol = exp(-a) - exp(-b) + (sqrt(pi)/4)*(erf(b - 4) - erf(a - 4));
  errs = [];
  for n=1:14
    x = linspace(a, b, n);
    w = pesosNewton(a, b, x);
    res = f(x)*w;
    er = abs(res - sol)/sol;
    errs(end+1) = er;
  end
  plot(1:length(errs), log(errs));
end

function cas1_2()
 % 2/(b-a)*x - (a+b)/(b-a)
end

