source('quads.m');

a = 0; b = 5;
f = @(x) exp(-x) + 0.5*exp(-(x - 4).^2);
sol = exp(-a) - exp(-b) + (sqrt(pi)/4)*(erf(b - 4) - erf(a - 4));
  
errs = []; ress = [];
  for n = 1:14
    [res1, err1] = integral_newton(f, a, b, n, sol);
    errs(1, end+1) = err1; ress(1, end+1) = res1; 
    [res2, err2] = integral_gauss(f, a, b, n, sol);
    errs(2, end) = err2; ress(2, end) = res2;
  end
plot(log(1:length(errs)), log(errs'));
legend('newton', 'gauss');

