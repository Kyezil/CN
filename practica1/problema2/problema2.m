% carrega la funcio f i df
source('p2_f.m');

theta0 = [1,1]';
% plot f(theta1, theta2)
tx = ty = linspace (0, pi/2, 50);


format long
% resol amb Newton per k = 2
disp('Resolució del sistema amb Newton, aprox inicial [1,1]');
[errs, sols] = newton_raphson(theta0, @(t) f(t, 2), @(t) df(t, 2), 100, 1e-15, false);
disp('Solució Newton:');
disp(sols(:, end));
% resol amb Broyden per k = 2
disp('Resolució del sistema amb Broyden, aprox inicial [1,1] i S0 = jacobiana([1,1])');
[errs2 sols2] = broyden(theta0, df(theta0, 2), @(t) f(t, 2), 100, 1e-15, false);
disp('Solució Broyden:');
disp(sols2(:, end));

plot(1:length(errs), log(errs), 1:length(errs2), log(errs2));
title('Convergència dels mètodes');
xlabel('iteració');
ylabel('log(err relatiu)');
legend('Newton', 'Broyden');

% evolucio amb velocitat de angular
function sols = evolucio(a,b,n)
	k = linspace(sqrt(a),sqrt(b),n) .^ 2;
	sols = [];
	for i = 1:n
		[err, sol] = newton_raphson([1,1]', @(x) f(x, k(i)), @(x) df(x, k(i)), 30, 1e-15, true);
		sols(:,end+1) = sol(:, end);
	endfor
	plot(k, sols(1,:), 'r', k, sols(2,:), 'b');
	title('Evolucio de la solucio segons W');
	xlabel('valor de LW/g');
	ylabel('solucio');
	legend('theta1', 'theta2');
endfunction

evolucio(1,20,10);
