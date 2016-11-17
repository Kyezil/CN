function w = pesosNewton(a, b, x) 
  w = [];
  i = 1:length(x);
  A = rot90(vander(x), length(x)+1);
  B = [ (b.^i - a.^i)./i ];
  w = A\B';
end