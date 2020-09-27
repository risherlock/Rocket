function [Fp] = computePropulsiveForce(time,gimble_state)
% 2020/9/17

r = configRocket();
T = interpolatedThrust(r.motor_thrust, time); % Propulsive thrust parallel x-axis (body) 

Fp = computeControlForce(T,gimble_state);
end

