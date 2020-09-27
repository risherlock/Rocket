function rocket = configRocket()
%%% Physical configurations of rocket
% 2020/9/15


rocket.I = diag([1,1,1]); % Inertia matrix
rocket.mass = 20; % Initial mass, kg
rocket.area = 50; % Ref area for aerodynamic force, m^2

rocket.Cn = 5; % Axial force coefficient (aero), dimensionless
rocket.Ca = 5; % Normal force coefficient (aero), dimensionless
rocket.xi = 10; % Distance from gimble turning to COM, m

rocket.area_nozzle = 2; % Nozzle exit area, m^2
rocket.thrust = 5000; % Thrust prodused from nozzle, N
rocket.m_dot = 1; % Mass flow rate, kg/s
rocket.pe = 1; % Average pressure across rocket nozzle exit area, Pa
rocket.Ve = 1; % Absolute velocity of exhaust gases, m/s

rocket.pa = 1; % Ambient atmospheric pressure, Pa
rocket.rho = 1; % Atmospheric density, kg/m^3 

rocket.motor_thrust = '/configs/Motors/Sugar_motor.csv';
end