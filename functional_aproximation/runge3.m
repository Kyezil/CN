function y = f(x)
  y = (x^2*25+1)^(-1);
endfunction

function val = prod(f,g,a,b,w)
  fgw = @(x) w(x)*f(x)*g(x);
  val = quad(fgw, a, b);
end

for m = 2:2:8
  coefs = [];
  for n=0:m
    p = @(x) polyval(legendre(n,x), x);
    normL = @(h) prod(h, @(x) p(x), -1, 1, @(x) 1);
    coefs(end+1) = normL(f)/normL(p);
  end
  disp(coefs);
endfor