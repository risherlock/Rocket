function [F_g] = computeGravitationalForce(mass,position,ypr)
% Rishav (2020/9/8)

go = 9.8; % Acceleration due to gravity at surface, m/s^2
Re = 6371000; % Radius of the Earth, m

h = Re - norm(position); % Height of rocket, m
g = go*(Re^2/(Re+h)^2); % Acceleration due to gravity correction

% Gravitational force in inertial frame
F_g_ = [0,0,mass*g]';

% Gravitational force in body frame
F_g = dcm321Euler(ypr(1),ypr(2),ypr(3))*F_g_;
end
