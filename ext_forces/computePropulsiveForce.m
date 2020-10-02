function [Fp,T] = computePropulsiveForce(t,gimble_state)
% 2020/9/17

r = configRocket();
T = interpolatedThrust(r.motor_thrust,t); % x-axial thrust  in body frame
Fp = computeControlForce(T,gimble_state); % Thrust vector due to gimble
end
