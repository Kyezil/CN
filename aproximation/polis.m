function y = fun(x)
  y = (x.^2 .* 25 .+1).^(-1);
end

f = @(x) fun(x);
a = -1; 
b = 1;
n = 4;

p1 = legendrepoly(n)
p2 = chebyshevpoly(1, n)
p3 = chebyshevpoly(1, n)