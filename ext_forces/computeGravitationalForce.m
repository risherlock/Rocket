function [F_g] = computeGravitationalForce(mass,position,ypr)
%%% Compute gravitational force in body frame
% Rishav (2020/9/8)

go = 9.8; % m/s^2
Re = 6371000; % m
h = Re - norm(position); 
g = go*(Re^2/(Re+h)^2); % g at h

F_g = dcm321Euler(ypr(1),ypr(2),ypr(3))*[0,0,mass*g]'; 
end
