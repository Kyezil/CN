X = [55.35, 49.85, 45.85, -25.15, -31.25, -34.95, -30.05, -25.85, 25.65, 33.49];
Y = [43.49, 49.58, 54.65, 55.35, 50.28, 42.19, -9.08, -14.55, -26.65, -24.95];

function nor = err(c, x)
% calcula l'error (suma de normes de tots els punts)
  nor = sqrt(sum((x .- c) .^ 2, 1));
end

function res = f(c, r, x) 
% calcula el valor de l'error amb minims quadrats
% c 2x1
% r 1x1
% x 2xN matrix [ x1 x2 ... xN
%                y1 y2 ... yN ]
  nor= err(c,x) .- r;
  res = sqrt(sum(nor .^ 2));
end

function res = df(c, r, x)
% calcula el gradient de f explictament
  res = zeros(rows(x), 1);
  tmp = err(c, x);
  for i = 1:rows(x)
    res(i) = 2*sum((tmp .- r) .* (x(i,:) .- c(i)) ./ tmp);
  end
end

r = @(c) mean(err(c, [X;Y]));
g = @(x) f(x, r(x) , [X;Y]);
dg = @(x) df(x, r(x), [X;Y]);
%dg = @(x) numericalDerivative(g, x);
x0 = mean([X;Y], 2);
Hg = numericalHessian(g, x0);
z = broyden(x0, Hg, dg);
