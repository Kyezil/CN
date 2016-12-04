function [x,Y] = eulerdar(f, interv, y0, n)
    a = interv(1);
    b = interv(2);
    % y0 = y(a)
    h = (b - a)./n;
    y = [y0]; Y=y;
    x = [a];
    for i = 2: n + 1
        x(i) = h.*(i - 1);
        f2 = @(z) z - y(i - 1) + f(x(i),z);
        [er,y] = broyden([x(i), y(i - 1)]', eye(length(y0 + 1)), f2);
        Y=[Y y];
    end
end