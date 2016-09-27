function r = residu(x)
  r = [
    6*x(1) - 2*cos(x(2)*x(3)) - 1,
    9*x(2) + sqrt(x(1)^2 + sin(x(3)) + 1.06) + 0.9,
    60*x(3) + 3*exp(x(1)*x(2)) + 10*pi - 3
  ];
endfunction

function J = jacobiana(x)
  J = [
    [ 6, 2*x(3)*sin(x(2)*x(3)), 2*x(2)*sin(x(2)*x(3)) ],
    [ x(1)/(sqrt(x(1)^2 + sin(x(3)) + 1.06)), 9, cos(x(3))/(2*(sqrt(x(1)^2 + sin(x(3)) + 1.06)))],
    [3*x(2)*exp(x(1)*x(2)), 3*x(1)*exp(x(1)*x(2)), 60]
  ];
endfunction
