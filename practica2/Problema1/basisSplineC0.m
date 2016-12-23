function y = basisSplineC0(n, p, x)
% basis of splines C0
% avalua l'element n-èssim de la base dels punts p en un valor x
  if (n == 1)
    if (x >= p(2) || x < p(1)) y = 0;
    else y = (p(2)-x)/(p(2)-p(1));
    end
  elseif(n == length(p))
    if (x <= p(end-1) || x > p(end)) y = 0;
    else y = (p(end-1)-x)/(p(end-1)-p(end));
    end
  else
    if (x <= p(n-1) || x >= p(n+1)) y = 0;
    elseif (x <= p(n)) y = (x-p(n-1))/(p(n)-p(n-1));
    else y = (x-p(n+1))/(p(n) - p(n+1));
    end
  end
end
