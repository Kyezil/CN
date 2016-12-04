function  r = simpAdav(f, a, b, tol) 
  mid = (a + b)/2;
  s1 = integral_newton(f, a, mid, 3, 0)(1);
  s2 = integral_newton(f, mid, b, 3, 0)(1);
  sres = s1 + s2;
  s = integral_newton(f, a, b, 3, sres)(1);
  err = abs(s - sres);
  
  if err < tol*(b - a)
    r = s;
  else
    r = simpAdav(f, a, mid, tol) + simpAdav(f, mid, b, tol);
  endif
end