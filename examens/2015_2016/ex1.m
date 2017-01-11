f = @(x) x .^ 5;
x = 1;

hs = 10.^[-1:-1:-4];

df = zeros(1,numel(hs));
er = df;

sol = 5;

for i = 1:numel(hs)
  h = hs(i);
  df(i) = (-9*f(x-h) + 8*f(x) + f(x+3*h))/(12*h);
  er(i) = abs((df(i) - sol)/sol);
  printf("It %d, approx %.6f, er %.6e\n", i, df(i), er(i));
end

