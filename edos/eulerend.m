function [x,y] = eulerend(f, interv, y0, n)
    a = interv(1);
    b = interv(2);
    % y0 = y(a)
    h = (b - a)/n;
    y = [y0];
    x = [a];
    for i = 2: n + 1
        x(i) = h*(i - 1);
        y(i) = y(i - 1) + h*f(x(i), y(i - 1));
    end
end