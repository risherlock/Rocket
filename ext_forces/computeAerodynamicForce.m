function [F_a] = computeAerodynamicForce(position,velocity)
%%% Computes aerodynamic force in body frame
% 2020/9/10

V = norm(velocity);
% u = velocity(1);
v = velocity(2);
w = velocity(3);

aero = configRocket; % Access rocket config
Ca = aero.Ca; % Axial force coefficient
Cn = aero.Cn; % Normal force coefficient

Cny = -Cn*v/sqrt(v^2 + w^2);
Cnz = -Cn/sqrt(v^2 + w^2);

[rho,~,~] = atmosphereModel(position); % Atmospheric density, kg/m^3

F_x = -0.5*rho*V^2*Ca*aero.area;
F_y = 0.5*rho*V^2*Cny*aero.area;
F_z = 0.5*rho*V^2*Cnz*aero.area;

%F_a = [F_x,F_y,F_z]';
F_a = [0,0,0]';
end
