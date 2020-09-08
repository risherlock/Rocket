function [state_dot] = rocketDynamicalModel(~,state,gimble_state)
% Rishav (2020/9/8)

% Unpack variables
ypr = state(1:3); % Orientation [yaw,pitvh,roll]'
omegas = state(4:6); % Angular velocities

F_p = computePropulsiveForce(thrust,gimble_state);
F_g = computeGravitationalForce(mass,height,ypr);
F_a = 0;
tau = computeControlMoment(thrust,gimble_state);

ypr_dot = eulerKinematics(t,ypr,omegas);
pqr_dot = rocketKinetics(t,omegas,tau);
uvw_dot = rocketTranslationKinetics(t,vels,omegas,F_a,F_g,F_p);

state_dot = [ypr_dot',pqr_dot'];
end