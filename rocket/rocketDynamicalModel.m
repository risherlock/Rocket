function [state_dot] = rocketDynamicalModel(t,state,gimble_state)
% Rishav (2020/9/8)

% Unpack variables
ypr = state(1:3); % Orientation vector
omega = state(4:6); % Angular velocity vector
position = state(7:9); % Position vector
velocity = state(10:12); % Translational velocity vector
mass = state(13); % Instantaneous mass


% Compute force and moments (In body frame)
[Fp,thrust] = computePropulsiveForce(t,gimble_state);
Fa = computeAerodynamicForce(position,velocity);
tau = computeControlMoment(thrust,gimble_state);

% Propagate states
ypr_dot = rocketRotationalKinematics(t,ypr,omega);
omega_dot = rocketRotationalKinetics(t,omega,tau);
position_dot = velocity;
velocity_dot = rocketTranslationalKinetics(t,ypr,mass,Fa,Fp);
g = computeAccelerationDueToGravity(position);
velocity_dot(1) = velocity_dot(1)-g;
m_dot = computeMassFlowRate(thrust);

state_dot = [ypr_dot',omega_dot',position_dot',velocity_dot',m_dot]';
end