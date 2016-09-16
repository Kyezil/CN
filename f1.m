function FX = eval_f(x)
  % evalua una funcio determinada
  % [IN] x del domini de f
  % [OUT] f(x)
  p = [1, -4, 7, -21, 6, 18];
  FX = polyval(p, x);
endfunction

function FX = eval_df(x)
  % evalua la derivada de f en x
  % [IN] on evaluar la derivada
  % [OUT] f'(x)
  dp = [5,-16, 21, -42, 6];
  FX = polyval(dp, x);
endfunction

function plot_f()
  % plot function f
  x = linspace(0,5,100);
  y = eval_f(x);
  plot(x, y);
endfunction
