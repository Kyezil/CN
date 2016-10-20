function d2S = calculaCurvaturesSplineNatural(x,y)
%% calcula curvatura spline natural pels punts y = f(x)
    n = length(x);
    i = 1:n-1;
    h = [ x(i+1)-x(i) ];
    b = [ y(i+1)-y(i) ] ./ h;
    i = 2:n-1;
    v = 2 .* [ h(i-1) + h(i) ];
    u = 6 .* [ b(i) - b(i-1) ];
    d2S = [0 solveTridiag(h,v,h,u) 0];
end
