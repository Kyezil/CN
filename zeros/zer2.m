
function res = fun(x)

  res = [ cos(x(1))*(8*sin(x(1)) + 3*sin(x(2))) - 9*sin(x(1)),
          cos(x(2))*(3*sin(x(1)) + 2*sin(x(2))) - 3*sin(x(2))];
        
endfunction


f = @(x) fun(x);
f([1,1])

J = @(x) Jacobian(f, x)
J([1, 1]')

x0 = [1, 1]';

[er1, sol1] = newton_raphson(x0, f, J);

[er1, sol2] = broyden(x0, f, J(x0));