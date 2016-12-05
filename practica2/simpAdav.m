function [res, x] = simpAdav(f, a, b, tol) 
  c = (a+b)/2;
  h = (b-a)/6;
  fa = f(a); fb = f(b); fc = f(c);
  s = h*(fa + 4*fc + fb);
  [res, x] = r_simpsons_adaptative(f, a, b, tol, s, fa, fb, fc);
end

function [res, x] = r_simpsons_adaptative(f, a, b, tol, total, fa, fb, fc) 
  c = (a + b)/2; d = (a + c)/2; e = (c + b)/2;
  h = abs(b - a)/6;
  fd = f(d); fe = f(e); % new points  a  d  c  e  b
  left = (h/2)*(fa + 4*fd + fc);
  right = (h/2)*(fc + 4*fe + fb);
  res = 0; x = [];
  % el 15 surt de compensar els errors numerics
  if (abs(left+right-total) <= 15*tol)
    res = left + right + (left + right - total)/15;
    x = [a, d, c, e, b];
  else
    [res1, x1] = r_simpsons_adaptative(f, a, c, tol/2, left, fa, fc, fd);
    [res2, x2] = r_simpsons_adaptative(f, c, b, tol/2, right, fc, fb, fe);
    res = res1 + res2;
    x = [x1, x2];
  end
end
