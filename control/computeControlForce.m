function [Fp] = computeControlForce(T,gimble_state)
% 2020/9/8 

% Unpack gimble angles (radians)
mu_1 = gimble_state(1);
mu_2 = gimble_state(2);

% Propulsive force components
F_px = T*cos(mu_1)*cos(mu_2);
F_py = T*cos(mu_2)*sin(mu_2);
F_pz = -T*sin(mu_2);

% Propulsive force vector
Fp = [F_px,F_py,F_pz]';
end