function y = basisSplineCubicC1(n, p, z)
% return value of evaluating the n'th element of the basis of splines
% n in [1,2*m]
% p 1xM base points
% z 1x? values between p
% for the points p at the point x
  m = length(p);
  type = idivide(n-1,m); % 0 or 1
  k = mod(n-1,m) + 1; % in [1,m]
  y = zeros(1,length(z));
  for i=1:length(z)
    x = z(i);
    % change of variable [a,b] -> [-1,1]
    ch = @(x,a,b) 2/(b-a)*(x - (a+b)/2);
    if (k == 1) % first one
      x0 = p(k); x1 = p(k+1);
      % use change of variable [x0,x1] -> [0,1]
      y(i) = basicSplineCubicC1((x-x0)/(x1-x0), type);
    elseif (k == m) % last one
      x0 = p(k-1); x1 = p(k);
      % use change of variable [x0,x1] -> [-1,0]
      y(i) = basicSplineCubicC1((x-x0)/(x1-x0) - 1, type);
    else % middle one
      x0 = p(k-1); x1 = p(k+1);
      y(i) = basicSplineCubicC1(ch(x, x0, x1), type);
    end
  end
end


function y = basicSplineCubicC1(z, type)
% return value of evaluating the basis in [-1,1]
% type = 0,1
  y = zeros(1,length(z));
  for i = 1:length(z)
    x = z(i);
    if (x <= -1 || x >= 1) y(i) = 0; % not in basis
    else
      if (type == 0)
        % basis with derivatives = 0
        if (x <= 0) % y0 = 0, y1 = 1
          y(i) = -2*(x+1)^3 + 3*(x+1)^2;
        else % y0 = 1, y1 = 0
          y(i) = 2*x^3 - 3*x^2 + 1;
        end
      elseif (type == 1)
        % basis with values = 0
        if (x <= 0) % y0'= 0, y1'=1
          y(i) = (x+1)^3 - (x+1)^2;
        else % y1' = 1, y0' = 0
          y(i) = x^3 - 2*x^2 + x;
        end
      end
    end
  end
end
