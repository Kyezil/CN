function [res, x] = simpAdavMod(f, a, b, tol) 
  x = [a, b];
  res = simpAdav2(f, a, b, tol);
  
  function  r = simpAdav2(f, a, b, tol) 
    mid = (a + b)/2;
    s1 = integral_newton(f, a, mid, 3, 0)(1);
    s2 = integral_newton(f, mid, b, 3, 0)(1);
    sres = s1 + s2;
    s = integral_newton(f, a, b, 3, sres)(1);
    err = abs(s - sres);
    if err < tol*(b - a)
      r = s;
    else
      x(end + 1) = mid;
      r = simpAdav2(f, a, mid, tol) + simpAdav2(f, mid, b, tol);
    endif
  end
  x = sort(x);
end