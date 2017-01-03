% aproximacio per minims quadrats amb polinomis ortogonals

function [X,Y] = aproxLeastSquares(f,interval,n)
  % aproxima f en [a,b] per minims quadrats per polinomis de legendre
  % n grau de l'aproximacio [0...Inf]
  % resultat amb plot(X,Y)
  a = interval(1); b = interval(2);

  % canvi de variable
  ch = @(x) 1/2 .* ( (b-a).* x .+ a .+ b ); % canvi [-1,1] -> [a,b]

  g = @(x) f(ch(x)); % composicio de f amb chinv
  % least squares, orthogonals !!
  coeffs = zeros(1,n+1);
  poly = [];
  for i=1:n+1
    pol = legendrepoly(i-1);
    p = @(x) polyval(pol, x); % polinomi de legendre
    coeffs(i) = quad(@(x) p(x)*g(x) ,-1,1)/quad(@(x) p(x).^2, -1, 1);
    poly = addpoly(poly, coeffs(i) .* pol);
  end
  
  x = linspace(-1,1,100);
  Y = polyval(poly, x);
  X = ch(x);
end

function r = addpoly(p,q)
  leftpadz = @(p1,p2) [zeros(1,max(0,numel(p2) - numel(p1))),p1];
  r = leftpadz(p,q) + leftpadz(q,p);
end

function example(x)
  % runge function
  f = @(x) (x .^ 2 .* 25 .+ 1) .^ (-1);
  Y = [];
  for i=10:10
    [x,y] = aproxLeastSquares(f, [-2,2],i);
    Y(i,:) = y;
  end
  plot(x,f(x),x,Y,'-o', 'markersize',1);
  legend('f');
end
