function x = solveTridiag(a,b,c,d)
%% resol un sistema tridiagonal 
% b vector diagonal dim n
% a vector sub diagonal dim n-1
% c vector super diagonal dim n-1
% d vector termes independents dim n
	n = length(b);
	%% forward elimination
	c(1) /= b(1)
	d(1) /= b(1)
	for i = 2:n-1
		m = b(i) - a(i-1)*c(i-1);
		c(i) /= m;
		d(i) = (d(i) - a(i-1)*d(i-1))/m;
	end
	d(n) = (d(n) - a(n-1)*d(n-1))/(b(n) - a(n-1)*c(n-1))
	% backwards substitution
		x = zeros(1,n);
	x(n) = d(n);
	for i = n-1:-1:1
		x(i) = d(i) - c(i)*x(i+1);
	end
end
