function [state_dot] =  rocketRotationalKinetics(~,omegas,tau)
%%% Rigid body rotational dynamics implementation
% 2020/6/14

w = omegas; % Angular velocities of satellite
rocket = configRocket;

% Rocket rotational dynamics
I = rocket.I;
state_dot = -I\(cross(w,I*w) - tau);
end