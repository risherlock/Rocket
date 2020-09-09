function [F_g] = computeGravitationalForce(mass,position,ypr)
% Rishav (2020/9/8)

go = 9.8; % m/s^2
Re = 6371000; % m

h = Re - norm(position); 
g = go*(Re^2/(Re+h)^2); % g correction

F_I = [0,0,mass*g]'; % Force in inertial frame
F_g = dcm321Euler(ypr(1),ypr(2),ypr(3))*F_I; % Body frame
end
