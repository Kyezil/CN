function problema1(splines = 1)
% problema 1 de la practica 2 de calcul numeric

  f = @(x) sin(x) + x ./ 4;
  x = [0,1,3,4,5,7];
  
  % splines  0 for lineals, 1 for cubics

  if (splines == 0)
    % splines lineals C0
    disp('Calcul dels coefficients per splines lineals');
    [coeffs,err] = leastSquareSplineLinealC0(f, x);
    % plot
    y = zeros(1,length(x));
    for i = 1:length(x)
      for j=1:length(coeffs)
        y(i) += coeffs(j)*basisSplineC0(j, x, x(i));
      end
    end
    err
    xx = linspace(x(1), x(end), 10*length(x));
    %plot de l'aproximacio per minims quadrats, de f i de l'interpolacio
    plot(x, y, "-bo", xx, f(xx), "r", x, f(x), "-o");
    % info for latex
%    for i=1:length(x)
    %  printf("(%d,%f)", x(i), y(i)); % least squares
%      printf("(%d,%f)", x(i), f(x(i)));
%    end
  elseif (splines == 1)
    disp('Calcul dels coefficients per splines cubics');
    [coeffs,err] = leastSquareSplineCubicC1(f, x);
    % plot
    factor = 10;
    xx = linspace(x(1), x(end), factor*length(x));
    yy = zeros(1, length(xx)); % thiner grain
    y = zeros(1, length(x)); % base points
    for i = 1:length(xx)
      for j=1:length(coeffs)
        yy(i) += coeffs(j)*basisSplineCubicC1(j, x, xx(i));
      end
    end
    % get base points
    for i = 1:length(x)
      for j=1:length(coeffs)
        y(i) += coeffs(j)*basisSplineCubicC1(j, x, x(i));
      end
    end
    err
    % plot approx minims quadrats
    plot(x, y, "bo",xx, yy, "b-", xx, f(xx), "r");
    % info for latex
%    for i=1:length(x)
    %  printf("(%d,%f)", x(i), y(i)); % least squares
%    end
%  interpolation
% xf = linspace(0,7,50);
% hermite = interp1(x, f(x), xf, f(xf));
% Z(:,1) = xf; Z(:,2) = hermite;
% save interpol.dat Z -ascii
  end
end

function [coeffs,err] = leastSquareSplineLinealC0(f, x)
  % f function to project
  % x 1xN base points
  % coeffs 1xN coef for each base of splines (basis has size n)

  x = sort(x); % ensure points are sorted
  coeffs = []; 
  % basis of splines C0
  n = length(x);
  a = zeros(1,n); % <Ni,Ni>
  b = zeros(1,n-1); %<Ni-1,Ni>
  a(1) = quad(@(z) basisSplineC0(1, x, z) ^ 2, x(1), x(2));
  for i=2:n
    a(i) = quad(@(z) basisSplineC0(i, x, z) ^ 2, x(max(1,i-1)), x(min(n,i+1)));
    b(i-1) = quad(@(z) basisSplineC0(i-1, x, z)*basisSplineC0(i, x, z), x(max(1,i-2)), x(min(n,i+1)));
  end
  % <Ni,f>
  c = zeros(1,n);
  for i=1:n
    c(i) = quad(@(z) basisSplineC0(i, x, z)*f(z), x(max(1,i-1)), x(min(n,i+1)));
  end
  coeffs = solveTridiag(b,a,b,c);
  err = dot(coeffs, c);
end

function [coeffs,err] = leastSquareSplineCubicC1(f,x)
% f function to project
% x 1xN base points
% coeffs 1x2N for each base of splines (basis has size 2n)
  x = sort(x);
  coeffs = [];
  n = length(x);
  A = zeros(2*n, 2*n); % system matrix
  b = zeros(1,2*n);    % independent term
  % compute A (pentadiagonal matrix)
  basis = @(k,z) basisSplineCubicC1(k, x, z);
  for i = 1:2*n
    ki = idivide(i-1,2) + 1; % position of basis_i in point vector
    for j = i:min(i+3, 2*n)
      kj = idivide(j-1,2) + 1; % position of basis_j in point vector
      A(i,j) = A(j,i) = quad(@(z) basis(i,z)*basis(j,z), x(max(1,ki-1)), x(min(n,kj+1)));  
    end
    % compute b
    b(i) = quad(@(z) basis(i,z)*f(z), x(max(1,ki-1)), x(min(n,ki+1)));
  end    
  % solve A*coeffs = b
  coeffs = A\b';
  err = dot(coeffs, b);
end
