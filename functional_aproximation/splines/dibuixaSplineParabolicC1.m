function [xd, yd, coeficients] = dibuixaSplineParabolicC1(x,y)
	% Funció per dibuixar un parabòlic C1
	% x  : coordenades dels punts base
	% y  : valors de la funció als punts base
	%
	% Es pot dibuixar amb
	%  plot(xd,yd)
	xd = []; yd = []; coeficients = [];
	x01 = [0:1/20:1]; % 20 subintervals
	h = x(2:end) - x(1:end-1);
	t = y(2:end) - y(1:end-1);
	df = 0; % valor de la primera derivada
	for i = 1:length(x)-1
		a = (t(i) - df*h(i))/h(i)^2;
		b = df;
		c = y(i);
		df = 2*t(i)/h(i) - df;
		xs = x(i) + x01*h(i);
		ys = a*(xs-x(i)).^2 + b*(xs-x(i)) + c;
		xd = [xd xs]; yd = [yd ys]; coeficients = [coeficients; a b c];
	end
end
