function [X,Y] = runge_kutta(f, interv, y0, n, opt)
% metode de runge kutta
  a = interv(1);
  h = (interv(2) - a)/n;
  r = length(opt.b); % ordre del metode
  X = zeros(1, n+1);
  Y = zeros(n+1, length(y0));
  Y(1,:) = y0; X(1) = a;
  for i=2:n+1
    k = zeros(r,length(y0));
    
    if strcmp(opt.method, 'explicit')
      for j=1:r
        x = X(i-1) + opt.c(j) * h;
        y = Y(i-1,:) + h*opt.A(j,:)*k;
        k(j,:) = f(x,y');
      end
    elseif strcmp(opt.method, 'semiimplicit')
      error ('semiimplicit not implemented');
    else
      error('implicit not implemented');
    end
    X(i) = a + h*(i-1);
    Y(i,:) = Y(i-1,:) + h*opt.b*k;
  end
end

% test runge_kutta
function example()
  f = @(x,y) [y(2); 6*x]; % [y'; 6x]
  [X1,Y1] = ode45(f, [0,10], [0,0]);
  [X2,Y2] = runge_kutta(f, [0,10], [0,0], 10, runge_explicit('rk4'));
  plot(X1,Y1(:,1),X2,Y2(:,1), '-o');
  legend('ode45', 'runge kutta');
end

function opt = runge_kutta_opt(A, c, b)
% genera una estructura de configuracio de runge_kutta
  % check sizes
  s = size(A);
  assert(s(1) == s(2));
  assert(s(1) == length(c));
  assert(s(2) == length(b));
  if isequal(A, tril(A,-1))
    t = 'explicit';
  elseif isequal(A, tril(A))
    t = 'semiimplicit';
  else
    t = 'implicit';
  end
  opt = struct('method', t, 'A', A, 'c', c, 'b', b);
end

function opt = runge_explicit(met)
% genera estructures de configuracio per metodes explicit optims
  if strcmp(met,'eulermod') % regla del punt mig
    opt = runge_kutta_opt([0,0;1/2,0], [0;1/2], [0,1]);
  elseif strcmp(met,'heun2') % crank nicolson trapezi
    opt = runge_kutta_opt([0,0;1,0], [0;1], [1/2, 1/2]);
  elseif strcmp(met,'kutta3') % simpson
    opt = runge_kutta_opt([0,0,0;1/2,0,0;-1,2,0], [0;1/2;1], [1/6,4/6,1/6]);
  elseif strcmp(met,'heun3')
    opt = runge_kutta_opt([0,0,0;1/3,0,0;0,2/3,0], [0;1/3;2/3], [1/4, 0, 3/4]);
  elseif strcmp(met,'runge4')
    opt = runge_kutta_opt([0,0,0,0;1/2,0,0,0;0,1/2,0,0;0,0,1,0], [0;1/2;1/2;1], [1/6,1/3,1/3,1/6]);
  elseif strcmp(met,'rk4') % newton cotes
    opt = runge_kutta_opt([0,0,0,0;1/3,0,0,0;-1/3, 1,0,0;1,-1,1,0], [0;1/3;2/3;1], [1/8,3/8,3/8,1/8]);
  end
end
