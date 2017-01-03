function [X,Y] = diffcen(f, interv, y0, n)
% metode explicit edo amb diff centrades
% y1 = y0 + h*f(x0,y0)
% y2 = y0 + 2h*f(x0,y0)

% f       funcio tal que dy/dx = f
% interv  [a;b] interval on avaluar
% y0      condicio inicial y(a) = y0
% n       nombre de passos/intervals a fer
 
% Y valor de la funcio en els punts X per files Y(i,:) = imatge de X(i) !!!
    a = interv(1); b = interv(2);
    h = (b - a)/n;
    X = zeros(1,n+1);
    Y = zeros(n+1, length(y0));
    Y(1,:) = y0; X(1) = a;
    for i = 2: n + 1
        X(i) = a + h*(i-1);
        if i == 2
          Y(i,:) = Y(i-1,:) +  h .* f(X(i), Y(i-1,:)')';
        else
          Y(i,:) = Y(i-1,:) + 2*h .* f(X(i), Y(i-1,:)')';
        end
    end
end

% exemple de diffcen
% y'' = 6x
% y(0) = y'(0) = 0
% interval 0,10

function example()
  f = @(x,y) [y(2); 6*x]; % [y'; 6x]
  [X1,Y1] = ode45(f, [0,10], [0,0]);
  [X2,Y2] = eulerend(f, [0,10], [0,0], 12);
  plot(X1,Y1(:,1),X2,Y2(:,1), '-o');
  legend('ode45', 'diffcen');
end
