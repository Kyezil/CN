%Modificacio de la quadratura de Simpson adaptativa per retornar la divisio de [a, b] resultant
function [res, x] = simpAdav(f, a, b, tol)
  c = (a+b)/2;
  fa = f(a); fb = f(b); fc = f(c);
  s = ((b-a)/6) * (fa + 4*fc + fb);
  [res, x] = r_simpAdav(f, [a,c,b], [fa,fc,fb], s, tol/(b - a));
end

function  [res, X] = r_simpAdav(f, x, fx, s, tol) 
% f     function to integrate
% x     [a,c,b] points where function is valued 
% fx    [fa,fc,fb] value of function in x
% s     value of the integral of f in [a,b]
% tol   max error wanted
  a = x(1); c = x(2); b = x(3);
  fa = fx(1); fc = fx(2); fb = fx(3);
  h = (b-a)/6; % interval
 
  % quad in [a c]
  d = (a+c)/2; fd = f(d);
  sleft = (h/2)*(fa + 4*fd + fc);
  % quad in [c b]
  e = (c+b)/2; fe = f(e);
  sright = (h/2)*(fc + 4*fe + fb);
  % quad in [a b]
  s2 = sleft + sright;
  
  err = abs(s - s2);
  if err >= tol*(b - a)
    [res1, x1] = r_simpAdav(f, [a,d,c], [fa,fd,fc], sleft, tol);
    [res2, x2] = r_simpAdav(f, [c,e,b], [fc,fe,fb], sright, tol);
    X = [x1, x2(2:end)];
    res = res1 + res2;
  else
    X = [a b];
    res = s;
  end
end
