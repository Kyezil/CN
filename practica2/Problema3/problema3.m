X = [55.35, 49.85, 45.85, -25.15, -31.25, -34.95, -30.05, -25.85, 25.65, 33.49];
Y = [43.49, 49.58, 54.65, 55.35, 50.28, 42.19, -9.08, -14.55, -26.65, -24.95];

function res = f(c, r, x) 
% c 2x1
% r 1x1
% x 2xN matrix [ x1 x2 ... xN
%                y1 y2 ... yN ]
  err = abs(sqrt(sum((x .- c) .^ 2, 1)) .- r);
  res = sum(err);
end

g = @(x) f(x(1:2), x(3) , [X;Y]);
dg = @(x) numeric_derivative(x, g);
x0 = [0, 0, 10]';
Hg = numericalHessian(g, x0);
z = broyden(x0, Hg, dg);