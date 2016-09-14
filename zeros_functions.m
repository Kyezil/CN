
function FX = evaluate_f(x)
    % evalua una funcio determinada
    % [IN] x del domini de f
    % [OUT] f(x)
    p = [1, -4, 7, -21, 6, 18];
    FX = polyval(p, x);
endfunction

function bisection(a0, b0)
  % usa el metode de la biseccio per trobar zeros en l'interval [a0,b0]
  % [IN] (a0,b0) interval de cerca inicial
  niter = 5;
  sign_left = evaluate_f(a0) >= 0;
  if (sign_left && evaluate_f(b0) >= 0)
    disp("interval no valid");
    return;
  endif
  
  for k = 1:niter
    printf("Iteration %d, interval [%f, %f]\n", k, a0, b0);
    mig = a0 + (b0-a0)/2;
    sign_mig = evaluate_f(mig) >= 0;
  endfor
endfunction

% ploting
p = [1, -4, 7, -21, 6, 18];
x = linspace(0,5,100);
y = polyval(p, x);
plot(x, y);
