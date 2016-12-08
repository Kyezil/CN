function y = f(x)
  y = (x.^2 .* 25 .+1).^(-1);
end

function val = prod(f,g,a,b,w)
  fgw = @(x) w(x)*f(x)*g(x);
  val = quad(fgw, a, b);
end

function y = evalLegendre(x, coefs)
	y = zeros(1, length(x));
 	for n=1:length(coefs)
 		y += coefs(n)*legendre(n-1, x)(1,:);
 	end
end

function allCoefs = interpolate()
	allCoefs = [];
	for m = 2:2:8
		coefs = [];
		for n=0:m
			p = @(x) legendre(n,x)(1,:);
			normL = @(h) prod(h, p, -1, 1, @(x) 1);
			coefs(end+1) = normL(@f)/normL(p);
		end
		allCoefs = resize(allCoefs, rows(allCoefs), length(coefs)); 
		allCoefs(end+1, :) = coefs;
	endfor
end

function plotInterpol()
	X = linspace(-1,1,20);
	% evaluate yy
	coefs = interpolate();
	Y = [];
	Y(:, end+1) = f(X);
	for i=1:rows(coefs)
		Y(:, end+1) = evalLegendre(X, coefs(i, :));
	end
	disp(Y);
	%plot(X, Y);
end
