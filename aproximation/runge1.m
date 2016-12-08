function y = f(x)
  y = (x .^ 2 .* 25 .+ 1) .^ (-1);
endfunction

xx = linspace(-1,1, 100);
yy = [f(xx)'];
for n = 3:2:9
  x = linspace(-1,1,n);
  y = f(x);
  p = polyfit(x,y,n-1);
  py = polyval(p, xx)';
  yy(:, end+1) = py;
endfor

% plot runge1
plot(xx, yy);
legend('f', 'p1', 'p2', 'p3', 'p4');