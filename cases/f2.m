function FX = eval_f(x)
  % evalua una funcio determinada
  % [IN] x del domini de f
  % [OUT] f(x)
  p = [1, -2, -6, 12, 9, 18];
  FX = polyval(p, x);
endfunction

function FX = eval_df(x)
  % evalua la derivada de f en x
  % [IN] on evaluar la derivada
  % [OUT] f'(x)
  dp = [5,-8, -18, 24, 9];
  FX = polyval(dp, x);
endfunction