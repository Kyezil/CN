function d2S = calculaCurvaturesSplineNatural(x,y)
%% calcula curvatura spline natural pels punts y = f(x)
	n = length(x);
	i = 2:n-2;
	h = [ (x(2)-x(1)) (x(i+1)-x(i)) (x(end)-x(end-1))];
	i = 3:n-2;
	v = [ (2*(h(1) - h(2))) (2*(h(i-1) - h(i))) (2*(h(end-1) - h(end)))];
end
