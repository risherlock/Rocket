function [state_dot] = rocketDynamicalModel(~,state,gimble_state)
% Rishav (2020/9/8)

% Unpack variables
ypr = state(1:3); % Orientation vector
omega = state(4:6); % Angular velocity vector
position = state(7:9); % Position vector
velocity = state(10:12); % Translational velocity vector

% Compute force and moments (Body frame)
F_p = computePropulsiveForce(thrust,gimble_state);
F_g = computeGravitationalForce(mass,position,ypr);
F_a = computeAerodynamicForce(velocity,area);
tau = computeControlMoment(thrust,gimble_state);

% Propagate states
ypr_dot = rocketRotationalKinematics(t,ypr,omega);
omega_dot = rocketRotationalKinetics(t,omega,tau);
position_dot = velocity; 
velocity_dot = rocketTranslationKinetics(t,velocity,omega,F_a,F_g,F_p); 

state_dot = [ypr_dot',omega_dot',position_dot',velocity_dot'];
end