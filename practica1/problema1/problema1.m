% calcula 4 iteracions de whittaker
disp("4 iteracions de whittaker per p1");
source('p1_f.m'); % carrega f(t,p) del problema

% executa 4 iteracions amb t0 = 2 i m = 7
[errs, sols] = whittaker([2, 7], @(t) f(t, [2.134141, 0.864141]), 4);

% representa l'evolucio de l'error
disp("representació de l'error relatiu");
solP1 = 1.04655891;
trueErrs = abs(sols - solP1)/solP1;
plot(log(trueErrs));
