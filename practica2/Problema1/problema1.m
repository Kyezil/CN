function problema1()
% problema 1 de la practica 2 de calcul numeric

  f = @(x) sin(x) + x ./ 4;
  x = [0,1,3,4,5,7];

  % splines lineals C0
  coeffs = leastSquareSplineLinealC0(f, x);
  % plot
  y = zeros(1,length(x));
  for i = 1:length(x)
    for j=1:length(coeffs)
      y(i) += coeffs(j)*basisSplineC0(j, x, x(i));
    end
  end
  xx = linspace(x(1), x(end), 10*length(x));
  %plot de l'aproximacio per minims quadrats, de f i de l'interpolacio
  plot(x, y, "-o", xx, f(xx), x, f(x), "-o");
end

function [coeffs] = leastSquareSplineLinealC0(f, x)
  % f function to project
  % x 1xN base points
  % coeffs 1xN coef for each base of splines (basis has size n)

  x = sort(x); % ensure points are sorted
  X = [];
  coeffs = []; 
  % basis of splines C0
  n = length(x);
  a = zeros(1,n); % <Ni,Ni>
  b = zeros(1,n-1); %<Ni-1,Ni>
  a(1) = quad(@(z) basisSplineC0(1, x, z) ^ 2, x(1), x(2));
  for i=2:n
    a(i) = quad(@(z) basisSplineC0(i, x, z) ^ 2, x(1), x(n));
    b(i-1) = quad(@(z) basisSplineC0(i-1, x, z)*basisSplineC0(i, x, z), x(1), x(n));
  end
  % <Ni,f>
  c = zeros(1,n);
  for i=1:n
    c(i) = quad(@(z) basisSplineC0(i, x, z)*f(z), x(1), x(n));
  end
  coeffs = solveTridiag(b,a,b,c);
end

function [coeffs] = leastSquareSplineCubicC1(f,x)
% f function to project
% x 1xN base points
% coeffs 2xN for each base of splines (basis has size 2n)


