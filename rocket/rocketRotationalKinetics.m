function [state_dot] =  rocketRotationalKinetics(~,omegas,t_ext)
%%% Rigid body rotational dynamics implementation
% Rishav (2020/6/14)

satelliteParams;  % Import satellite parameters
w = omegas; % Angular velocities of satellite

% Rocket rotational dynamics
state_dot =  - J_sat\(cross(w,J_sat*w) - t_ext);
end