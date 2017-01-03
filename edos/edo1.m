
f = @(x,y) -y/(10*x+1); 
a=0; 
b=2; 
y0=1;
h=0.1;
 
[x,Y]=ode45(f,[a,b],y0);
%figure(1), plot(x,Y,'-*'), title('ode45')

%Solucio amb el metode d'Euler endavant
 npassos=ceil((b-a)/h); 
 [x2,Y2]=eulerend(f,[a,b],y0,npassos);
 %figure(2), plot(x2,Y2,'-*'), title('Euler end')
 
 plot(x,Y,'-*', x2, Y2, '-*');
 legend('ode45', 'euler end');


 err = [];
 H = 0.1 * 0.5 .^(0:5);
 passos = [];
 for h=H
     npassos=ceil((b-a)/h); 
     passos(end + 1) = npassos;
     [xh,Yh]=eulerend(f,[a,b],y0,npassos);
     err(end+1) = abs(Yh(end) - Y(end));
 end
 
figure(3), plot(log10(passos), log10(err)), title('Error euler x=2') 
