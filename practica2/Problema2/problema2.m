source('quads.m');
f = @(x) sin(exp(x));
a = 0; b = 3;

sol = quad(f, a, b);
error = [];
for k=1:4 %Aproximacio de la integral I amb les formules compostes del trapezi i de Simpson
          % per a m = 4, 8, 16, 32
    m = 2*2^k;
    q = @(u, v) integral_newton(f, u, v, 2, sol);
    error(1, end + 1) = abs(integral_composta(q, a, b, m)(1) - sol);
    q = @(u, v) integral_newton(f, u, v, 3, sol);
    error(2, end) = abs(integral_composta(q, a, b, m)(1) - sol);
end

%Evolucio de l'error
nPuntsTrap = 2*2.^[1:4]+1;
nPuntsSimp = 3*2.^[1:4]+1;

figure(1);
hold on;
plot(log10(nPuntsTrap),log10(error(1,:)),'-o',log10(nPuntsSimp),log10(error(2,:)),'-o');
xlabel('log_{10}(#punts)'), ylabel('log_{10}(error)');
legend('Composta de trapezi','Composta de Simpson');
hold off;

%Aproximacio amb 6 xifres significatives

c1 = 32^2*error(1, end);
c2 = 32^4*error(2, end);

tol = 1/2*10e-6; %busquem un error menor que 0.5*1e-6
disp('m deduit per quadratura composta del trapezi per 6 xifres significatives:')
m1 = round((c1/tol)^(1/2));
disp(m1)
disp('m deduit per quadratura composta de Simpson per 6 xifres significatives:')
m2 = round((c2/tol)^(1/4));
disp(m2)

disp('Error per a la quadratura del trapezi amb m deduit:')
q = @(u, v) integral_newton(f, u, v, 2, sol);
er1 = abs(integral_composta(q, a, b, m1)(1) - sol);
disp(er1)

disp('Error per a la quadratura de Simpson amb m deduit:')
q = @(u, v) integral_newton(f, u, v, 3, sol);
er2 = abs(integral_composta(q, a, b, m2)(1) - sol);
disp(er2)

fprintf('\n')

%Quadratura de Simpson adaptativa aplicada a la integral I

[res, x] = simpAdav(f, a, b, 10^(-4));
y = arrayfun(f,x);
nPuntsAdap1 = length(x);
disp('Valor de referencia de la integral:')
disp(sol)
disp('Valor calculat de la integral amb el metode adaptatiu:')
disp(res)

figure(2)
plot(x, y, '-o');

[r, x] = simpAdav(f, a, b, 10^(-8));
y = arrayfun(f,x);
nPuntsAdap2 =length(x);
title('Punts de la quadratura de Simpson adaptativa amb error menor a 10^-^4')

figure(3)
plot(x, y, '-o');
title('Punts de la quadratura de Simpson adaptativa amb error menor a 10^-^8')

fprintf('\n')

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

while er >= 10^(-8)
  q = @(u, v) integral_newton(f, u, v, 3, sol);
  er = abs(integral_composta(q, a, b, m)(1) - sol);
  m += 4;
end
nPuntsComp2 = m;

disp('Numero de subintervals Simpson adaptativa per error menor a 10^-4:')
disp(nPuntsAdap1)
disp('Numero de subintervals Simpson composta per error menor a 10^-4:')
disp(nPuntsComp1)
disp('Numero de subintervals Simpson adaptativa per error menor a 10^-8:')
disp(nPuntsAdap2)
disp('Numero de subintervals Simpson composta per error menor a 10^-8:')
disp(nPuntsComp2)
