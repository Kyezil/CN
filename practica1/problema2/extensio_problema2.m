% carrega la funcio f3 i df3
source('extensiop2_f.m');

theta0 = [1,1,1]';
% resol amb Newton per k = 2
disp('Resolució del sistema amb Newton, aprox inicial [1,1,1]');
[errs, sols] = newton_raphson(theta0, @(t) f3(t, 2), @(t) df3(t, 2), 100, 1e-15, false);
disp('Solució Newton:');
disp(sols(:, end));

% resol amb Broyden per k = 2
disp('Resolució del sistema amb Broyden, aprox inicial [1,1,1] i S0 = jacobiana([1,1,1])');
[errs2 sols2] = broyden(theta0, df3(theta0, 2), @(t) f3(t, 2), 100, 1e-15, false);
disp('Solució Broyden:');
disp(sols2(:, end));

plot(1:length(errs), log(errs), 1:length(errs2), log(errs2));
title('Convergència dels mètodes');
xlabel('iteració');
ylabel('log(err relatiu)');
legend('Newton', 'Broyden');

% evolucio amb velocitat de angular creixent (picarse be)!!!!!!!!!!!!!!!!!!!!!!!!
function sols = evolucio2(a,b,n)
	k = linspace(sqrt(a),sqrt(b),n) .^ 2;
	sols = [];
	for i = 1:n
		[err, sol] = newton_raphson([1,1,1]', @(x) f3(x, k(i), k(i)), @(x) df3(x, k(i), k(i)), 30, 1e-15, true);
		sols(:,end+1) = sol(:, end);
	endfor
	plot(k, sols(1,:), 'r', k, sols(2,:), 'b', sols(3,:), 'g');
	title('Evolucio de la solucio segons W');
	xlabel('valor de LW/g');
	ylabel('solucio');
	legend('theta1', 'theta2','theta3');
endfunction

%evolucio2(1,20,10);

