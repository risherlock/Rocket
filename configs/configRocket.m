function rocket = configRocket()
%%% Physical configurations of rocket
% 2020/9/15

rocket.I = diag([1,1,1]); % Inertia matrix
rocket.m = 20; % Initial mass, kg
rocket.area = 50; % Ref area for aerodynamic force, m^2
rocket.Cn = 5; % Axial force coefficient (aero), dimensionless
rocket.Ca = 5; % Normal force coefficient (aero), dimensionless
rocket.xi = 10; % Distance from gimble to COM, m
end