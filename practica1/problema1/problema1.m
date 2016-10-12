% calcula 4 iteracions de whittaker
disp("4 iteracions de whittaker per p1");
source('p1_f.m'); % carrega f(t,p) del problema

% adaptador pel punt p1
function ft = fp1(t)
	ft = f(t, [2.134141, 0.864141]);
endfunction
% executa 4 iteracions amb t0 = 2 i m = 7
[errs, sols] = whittaker([2, 7], 'fp1', 4);

% representa l'evolucio de l'error
disp("representació de l'error relatiu");
solP1 = 1.04655891;
trueErrs = abs(sols - solP1)/solP1;
plot(log(trueErrs));
