% Objectius:
% - Entendre els conceptes basics dels metodes per a la resolucio numerica
% d'EDOs.
% - Implementar un metode per resoldre EDOs (metode d'Euler)
% - Comprovar experimentalment la convergencia d'un metode
%
% Tasques a fer:
% 1) Executar i mirar aquest script per veure com es pot resoldre el 
%    problema de valor inicial (PVI) amb la funcio de Matlab ode45
% 2) Implementar el metode d'Euler per a la resolucio del mateix PVI
%    Cal crear la funcio Euler amb els arguments d'entrada i sortida
%    especificats a aquest script. 
% 3) Dibuixar una grafica de log10(abs(error)) en funcio de log10(h), on l'error
%    s'evalua com la diferencia entre la solucio analitica i la solucio
%    numerica per x=2. Comprovar si l'ordre de convergencia coincideix amb
%    el teoric.
% Es proposa ara resoldre el PVI y''= -y, y(0)=1, y'(0)=0 per x en (0,T)
% 4) Reduir la EDO de segon ordre a un sistema d'EDOs de 1er ordre
%    Resoldre numericament el PVI amb el metode d'Euler per T=2*pi. Comprovar
%    la converg?ncia.
% 5) Amb h=0.01 resoldre el problema per T=10*pi,50*pi. ?s el m?tode
%    (absolutament) estable? 


f=@(x,y) -y/(10*x+1); 
a=0; 
b=2;  y0=1;

%Solucio amb funcions intrinseques de Matlab
[x,Y]=ode45(f,[a,b],y0);
figure(1), plot(x,Y,'-*'), title('ode45')

%Solucio amb el metode d'Euler
 h=0.1;
 npassos=ceil((b-a)/h); 
 [x2,Y2]=eulerend(f,[a,b],y0,npassos);
 %figure(2), plot(x2,Y2,'-*'), title('Euler')
 
 err = [];
 H = 0.1 * 0.5 .^(0:5);
 for h=H
     npassos=ceil((b-a)/h); 
     [xh,Yh]=eulerend(f,[a,b],y0,npassos);
     err(end+1) = abs(Yh(end) - Y(end));
 end
 %figure(3), plot(log10(H), log10(err)), title('Error euler x=2')
 
 %Solu segon sistema
 h = 0.1;
 a = 0; b = 2*pi;
 f = @(x, y) [0, 1; -1 0]*y;
 y0 = [1; 0];
             

[x,Y]=ode45(f,[a,b],y0);
figure(4), plot(x,Y,'-*'), title('ode45, 2')

 npassos=ceil((b-a)/h); 
 [x2,Y2]=eulerend(f,[a,b],y0,npassos);
 figure(5), plot(x2,Y2,'-*'), title('Euler2')
 
 h = 0.01;
 a = 0; b = 5*pi;
 f = @(x, y) [0, 1; -1 0]*y;
 y0 = [1; 0];
             
 npassos=ceil((b-a)/h); 
 [x2,Y2]=eulerend(f,[a,b],y0,npassos);
 figure(6), plot(x2,Y2,'-*'), title('Euler2')
 
 
npassos=ceil((b-a)/h); 
[x2,Y2]=eulerdar(f,[a,b],y0,npassos);
figure(7), plot(x2,Y2,'-*'), title('Eulerdar')
 