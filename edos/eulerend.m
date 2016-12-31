function [x,Y] = eulerend(f, interv, y0, n)
    a = interv(1);
    b = interv(2);
    % y0 = y(a)
    h = (b - a)./n;
    y = [y0]; Y=y;
    x = [a];
    for i = 2: n + 1
        x(i) = h.*(i - 1);
        y = y + h.*f(x(i), y);
        Y=[Y y];
    end
end