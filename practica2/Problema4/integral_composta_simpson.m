%Quadratura de Simpson composta de la funcio f entre a i b
function res = integral_composta_simpson(f, a, b, m)
  q = @(u, v) integral_simpson(f, u, v);
  x = linspace(a,b,m+1);
  res = 0;
  for i = 1:length(x)-1
    res = res + q(x(i), x(i+1));
  end
end

%Quadratura de Simpson de la funcio f entre a i b
function res = integral_simpson(f, a, b)
  mid = (a + b)/2;
  w = [1/6, 4/6, 1/6]';
  x = [a, mid, b];
  res = (b - a)*f(x)'*w;
end