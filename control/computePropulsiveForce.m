function [F_p] = computePropulsiveForce(Fp,gimble_state)
% 2020/9/8 

% Unpack gimble angles (radians)
mu_1 = gimble_state(1);
mu_2 = gimble_state(2);

% Propulsive force components
F_px = Fp*cos(mu_1)*cos(mu_2);
F_py = Fp*cos(mu_2)*sin(mu_2);
F_pz = -Fp*sin(mu_2);

% Propulsive force vector
F_p = [F_px,F_py,F_pz]';
end