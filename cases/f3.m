function FX = eval_f(x)
  % evalua una funcio determinada
  % [IN] x del domini de f
  % [OUT] f(x)
  p = [3, -8, -12, 32, 12, -32];
  FX = polyval(p, x);
endfunction

function FX = eval_df(x)
  % evalua la derivada de f en x
  % [IN] on evaluar la derivada
  % [OUT] f'(x)
  dp = [15,-32, -36, 64, 12];
  FX = polyval(dp, x);
endfunction
