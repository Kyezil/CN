clear variables; close all;

load corba;
 
p_plot = gamma(linspace(a,b,1000));
figure(1); plot3(p_plot(:,1),p_plot(:,2),p_plot(:,3),'k-'); axis equal; axis off;

% Tasques principals:
% - definir parametre arc s(t) (arxiu s.m)
% - trobar inversa de s(t) donat un valor de s
% - trobar distribucio de punts equiespaiats sobre la corba

%deduccio de m
solu = s(b, 100);
sb = s(b, 1);
err = abs(sb - solu)/solu;
m = 2;
while err >= 1e-4
    sb = s(b, m);
    err = abs(sb - solu)/solu;
    m = m + 1;
end
disp('s(b): ')
disp(sb)
disp('m: ')
disp(m)

%apartats b, c
d = s(b, m); 
c = s(a, m); 
s2 = (c + d)/2;
t2 = resol(s2, 0.7, m, @(t) dgamma(t));

disp('(s(a) + s(b))/2 :')
disp(s2)
disp('t corresponent: ')
disp(t2)

%apartat d
x = linspace(c, d, 35);
res = a;
punts = gamma(a);
for i = 2:length(x) %distribucio equiespaiada
    res(i) = resol(x(i), 0.7, m, @(t) dgamma(t)); %resol es la inversa de s
    punts(i,:) = gamma(res(i));
end

disp('t1: ')
res(1)
disp('t2: ')
res(2)
disp('t3: ')
res(3)
disp('p1: ')
punts(1, :) 
disp('p2: ')
punts(2, :)
disp('p3: ')
punts(3, :)

disp('d(p1, p2): ')
disp(s(res(2), m) - s(res(1), m))
disp('d(p2, p3): ')
disp(s(res(3), m) - s(res(2), m))