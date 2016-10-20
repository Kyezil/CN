function y = f(x)
  y = (x .^ 2 .* 25 .+ 1) .^ (-1);
endfunction

xx = linspace(-1,1, 101);
yy = [f(xx)'];
norms = [];
for n = 2:2:8
  [p,S] = polyfit(xx, yy(:,1)',n);
  py = polyval(p, xx)';
  yy(:, end+1) = py;
  norms(end + 1) = S.normr;
endfor

% plot runge2
figure;
subplot(2,1,1);
plot(xx, yy);
legend('f', 'p1', 'p2', 'p3', 'p4');

subplot(2,1,2);
plot(1:length(norms), norms);