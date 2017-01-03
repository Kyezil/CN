% test of ode45 usage

% dy/dx = f
f = @(vt,vy) [vy(2); (1 - vy(1)^2) * vy(2) - vy(1)];

% defineix com mostrar i l'error volgut
vopt = odeset ('OutputFcn', @odeplot, 'RelTol', 1e-6);

% resolucio
vsol = ode45 (f, [0 20], [2 0], vopt);

