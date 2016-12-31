function [x,Y] = eulerdar(f, interv, y0, n)
    a = interv(1);
    b = interv(2);
    % y0 = y(a)
    h = (b - a)./n;
    y = [y0]; Y = y;
    x = [a];
    for i = 2: n + 1
        x(i) = h.*(i - 1);
        f2 = @(t) t - Y(i - 1) + f(x(i),t);
        y = broyden([x(i), Y(i - 1)]', f2, eye(length(y0)));
        Y=[Y y];
    end
end