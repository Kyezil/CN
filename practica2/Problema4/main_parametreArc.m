clear variables; close all;

load corba;
 
p_plot = gamma(linspace(a,b,1000));
figure(1); plot3(p_plot(:,1),p_plot(:,2),p_plot(:,3),'k-'); axis equal; axis off;

% Tasques principals:
% - definir parametre arc s(t) (arxiu s.m)
% - trobar inversa de s(t) donat un valor de s
% - trobar distribucio de punts equiespaiats sobre la corba
m = 20;

d = s(b, m);
c = s(a, m); 
x = linspace(c, d, 35);
res = a;
punts = gamma(a);
for i = 2:length(x)
    res(i) = resol(x(i), 0.7, m); %resol es la inversa de s
    punts(i,:) = gamma(res(i));
end
res(1)
res(2)
res(3)
punts(1, :) 
punts(2, :) 
punts(3, :)

s(res(2), m) - s(res(1), m)
s(res(3), m) - s(res(2), m)