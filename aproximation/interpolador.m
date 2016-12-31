function y = f(x)
  y = (x .^ 2 .* 25 .+ 1) .^ (-1);
endfunction

a = -1;
b = 1;
n = 100;
xx = linspace(a, b, 100);
yy = [f(xx)'];

x = linspace(a, b,n);
y = f(x);
p = polyfit(x,y,n-1);
py = polyval(p, xx)';

yy(:, end+1) = py;
  

% plot runge1
plot(xx, yy);
legend('f', 'p');