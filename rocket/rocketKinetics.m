function [state_dot] =  satelliteKinetics(t,state,w_rw,t_rw,t_ext)
%%% Satellite rotational dynamics implementation
% Rishav (2020/6/14)

satelliteParams;  % Import satellite parameters
rwParams;         % Import satellite parameters

w = state; % Angular velocities of satellite
S = [0 -w(3) w(2); w(3) 0 -w(1); -w(2) w(1) 0]; % Cross product operation

% Satellite rotational dynamics
state_dot =  - J_sat\(cross(w,J_sat*w) + t_rw + S*J_rw*w_rw - t_ext);
end