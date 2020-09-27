function [state_dot] = rocketDynamicalModel(t,state,gimble_state)
% Rishav (2020/9/8)

% Unpack variables
ypr = state(1:3); % Orientation vector
omega = state(4:6); % Angular velocity vector
position = state(7:9); % Position vector
velocity = state(10:12); % Translational velocity vector
mass = state(13); % Instantaneous mass

thrust = 5000;
area = 2;
rho = 1;
m_dot = 5;

% Compute force and moments (In body frame)
Fp = computePropulsiveForce(t,gimble_state);
Fg = computeGravitationalForce(mass,position,ypr);
Fa = computeAerodynamicForce(velocity,area,rho);
tau = computeControlMoment(thrust,gimble_state);

% Propagate states
ypr_dot = rocketRotationalKinematics(t,ypr,omega);
omega_dot = rocketRotationalKinetics(t,omega,tau);
position_dot = velocity;
velocity_dot = rocketTranslationalKinetics(t,velocity,omega,mass,Fa,Fg,Fp);

state_dot = [ypr_dot',omega_dot',position_dot',velocity_dot',m_dot]';
end