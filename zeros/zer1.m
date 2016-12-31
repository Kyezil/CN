function res = fun(x)

  res = sin(exp(x));
        
endfunction


f = @(x) fun(x);

df = @(x) numericalDerivative(f, x);

x0 = 1;

[er1, sol1] = newton(x0, f, df);

x1 = x0 - f(x0)/df(x0);
[er2, sol2] = secant([x0, x1], f);
