source('quads.m');
f = @(x) sin(exp(x));
a = 0; b = 3;

sol = quad(f, a, b);
error = [];
for k=1:5
    m = 2*2^k; %numero d'intervals
    q = @(u, v) integral_newton(f, u, v, 2, sol);
    error(1, end + 1) = abs(integral_composta(q, a, b, m)(1) - sol);
    q = @(u, v) integral_newton(f, u, v, 3, sol);
    error(2, end) = abs(integral_composta(q, a, b, m)(1) - sol);
end

nPuntsTrap = 2*2.^[1:5]+1;
nPuntsSimp = 2*2.^[1:5]+1;

figure(1) 
plot(log10(nPuntsTrap),log10(error(1,:)),'-o') 
xlabel('log_{10}(#punts)'), ylabel('log_{10}(error)')
legend('Composta de trapezi')

figure(2) 
plot(log10(nPuntsSimp),log10(error(2,:)),'-o') 
xlabel('log_{10}(#punts)'), ylabel('log_{10}(error)')
legend('Composta de Simpson')


[r, x] = simpAdavMod(f, a, b, 10^(-4));
y = arrayfun(f,x);
length(x)

figure(3)
plot(x, y, '-o');
legend('Punts de la quadratura de Simpson adaptativa amb error menor a 10^-^4')

[r, x] = simpAdavMod(f, a, b, 10^(-8));
y = arrayfun(f,x);
length(x)

figure(4)
plot(x, y, '-o');
legend('Punts de la quadratura de Simpson adaptativa amb error menor a 10^-^8')

m = 4;

while true
  q = @(u, v) integral_newton(f, u, v, 3, sol);
  er = abs(integral_composta(q, a, b, m)(1) - sol);
  if er < 10^(-4)
    break;
  endif
  m += 1;
end
m

m = 4;

while true
  q = @(u, v) integral_newton(f, u, v, 3, sol);
  er = abs(integral_composta(q, a, b, m)(1) - sol);
  if er < 10^(-8)
    break;
  endif
  m += 1;
end
m


