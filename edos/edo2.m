 h = 0.1;
 a = 0; b = 2*pi;
 f = @(x, y) [0, 1; -1 0]*y;
 y0 = [1; 0];
             

[x,Y]=ode45(f,[a,b],y0);
figure(4), plot(x,Y,'-*'), title('ode45, 2')

npassos=ceil((b-a)/h); 
[x2,Y2]=eulerend(f,[a,b],y0,npassos);
figure(5), plot(x2,Y2,'-*'), title('Eulerend')


[x2,Y2]=eulerdar(f,[a,b],y0,npassos);
figure(7), plot(x2,Y2,'-*'), title('Eulerdar')
 