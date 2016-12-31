clear all; close all; clc
source('quads.m')

f = @(x)( exp(-x)+0.5*exp(-(x-4).^2) ); 
a = 0; b = 5; 
I_ex = exp(-a) - exp(-b) + (1/4)*sqrt(pi)*(erf(b-4) - erf(a-4));

error=[];

for k=1:5
    m = 2*2^k; %numero d'intervals 4, 8, 16, 32, 64
    
    error(1, end+1) = abs(compostaTrapezi(f,a,b,m)-I_ex);
    q = @(u, v) integral_newton(f, u, v, 3, I_ex);
    error(2, end) = abs(integral_composta(q, a, b, m)(1) - I_ex);
    q = @(u, v) integral_gauss(f, u, v, 2, I_ex);
    error(3, end) = abs(integral_composta(q, a, b, m)(1) - I_ex);
    q = @(u, v) integral_gauss(f, u, v, 3, I_ex);
    error(4, end) = abs(integral_composta(q, a, b, m)(1) - I_ex);
       
end

nPuntsTrap = 2*2.^[1:5]+1;
nPuntsSimp = 3*2.^[1:5]+1;
nPuntsGauss2 = 4*2.^[1:5];
nPuntsGauss3 = 6*2.^[1:5];

%Grafica errors
figure(1);
hold on;
plot(log10(nPuntsTrap),log10(error(1,:)),'-o',log10(nPuntsSimp),log10(error(2,:)),'-o',log10(nPuntsGauss2),log10(error(3,:)),'-o',log10(nPuntsGauss3),log10(error(4,:)),'-o');
xlabel('log_{10}(#punts)'), ylabel('log_{10}(error)');
legend('Composta de trapezi','Composta de Simpson', 'Composta de Gauss2', 'Composta de Gauss3');
hold off;


ajust = polyfit(log10(nPuntsTrap(3:5)),log10(error(1,3:5)),1);
fprintf('\nPendent 3 darrers punts:\n Composta trapezi: %0.1f \n',ajust(1));

ajust = polyfit(log10(nPuntsSimp(3:5)),log10(error(2,3:5)),1);
fprintf('\nPendent 3 darrers punts:\n Composta Simpson: %0.1f \n',ajust(1));

ajust = polyfit(log10(nPuntsGauss2(3:5)),log10(error(3,3:5)),1);
fprintf('\nPendent 3 darrers punts:\n Composta Gauss2: %0.1f \n',ajust(1));

ajust = polyfit(log10(nPuntsGauss3(3:5)),log10(error(4,3:5)),1);
fprintf('\nPendent 3 darrers punts:\n Composta Gauss3: %0.1f \n',ajust(1));