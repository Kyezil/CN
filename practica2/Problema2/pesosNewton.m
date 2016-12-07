function w = pesosNewton(a, b, x) %calcula els pesos de la Quadratura de Newton
  w = [];
  i = 1:length(x);
  A = rot90(vander(x), 1);
  B = [ (b.^i - a.^i)./i ];
  w = A\B';
end
