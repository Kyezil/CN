source('quads.m');
f = @(x) sin(exp(x));
a = 0; b = 3;

sol = quad(f, a, b);
error = [];
for k=1:5 %Aproximacio de la integral I amb les formules compostes del trapezi i de Simpson
          % per a m = 4, 8, 16, 32
    m = 2*2^k; 
    q = @(u, v) integral_newton(f, u, v, 2, sol);
    error(1, end + 1) = abs(integral_composta(q, a, b, m)(1) - sol);
    q = @(u, v) integral_newton(f, u, v, 3, sol);
    error(2, end) = abs(integral_composta(q, a, b, m)(1) - sol);
end

%Evolucio de l'error
nPuntsTrap = 2*2.^[1:5]+1;
nPuntsSimp = 3*2.^[1:5]+1;

figure(1);
hold on;
plot(log10(nPuntsTrap),log10(error(1,:)),'-o',log10(nPuntsSimp),log10(error(2,:)),'-o');
xlabel('log_{10}(#punts)'), ylabel('log_{10}(error)');
legend('Composta de trapezi','Composta de Simpson');
hold off;

%Aproximacio amb 6 xifres significatives

%Quadratura de Simpson adaptativa aplicada a la integral I

[r, x] = simpAdav(f, a, b, 10^(-4));
y = arrayfun(f,x);
nPuntsAdap1 = length(x);

figure(2)
plot(x, y, '-o');
title('Punts de la quadratura de Simpson adaptativa amb error menor a 10^-^4')

[r, x] = simpAdav(f, a, b, 10^(-8));
y = arrayfun(f,x);
nPuntsAdap2 =length(x);

figure(3)
plot(x, y, '-o');
title('Punts de la quadratura de Simpson adaptativa amb error menor a 10^-^8')

%Comparacio del numero de subintervals requerits entre la quadratura de Simpson
% i la quadratura de Simpson adaptativa

m = 4;
er = 1;
while er >= 10^(-4)
  q = @(u, v) integral_newton(f, u, v, 3, sol);
  er = abs(integral_composta(q, a, b, m)(1) - sol);
  m += 2;
end
nPuntsComp1 = m;

m = 4;
er = 1;
while er >= 10^(-8)
  q = @(u, v) integral_newton(f, u, v, 3, sol);
  er = abs(integral_composta(q, a, b, m)(1) - sol);
  m += 2;
end
nPuntsComp2 = m;

nPuntsAdap1
nPuntsComp1
nPuntsAdap2
nPuntsComp2
