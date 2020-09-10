function [F_a] = computeAerodynamicForce(velocity,area)
%%% Computes aerodynamic force in body frame
% Rishav (2020/9/10)

% Normal force coefficients
v = norm(velocity);
Cny = -Cn*v/sqrt(v^2 + w^2);
Cnz = -Cn/sqrt(v^2 + w^2);

F_x = -0.5*rho*V^2*Ca*area;
F_y = 0.5*rho*V^2*Cny*area;
F_z = 0.5*rho*V^2*Cnz*area;

F_a = [F_x,F_y,F_z];
end
