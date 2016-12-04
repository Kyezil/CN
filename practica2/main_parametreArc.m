clear variables; close all;

load corba;
 
p_plot = gamma(linspace(a,b,1000));
figure(1); plot3(p_plot(:,1),p_plot(:,2),p_plot(:,3),'k-'); axis equal; axis off;

% Tasques principals:
% - definir parametre arc s(t)
% - trobar inversta de s(t) donat un valor de s
% - trobar distribucio de punts equiespaiats sobre la corba