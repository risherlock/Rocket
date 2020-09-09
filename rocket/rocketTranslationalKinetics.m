function [acceleration] = rocketTranslationalKinetics(~,velocity,omega,F_a,F_g,F_p)
%%% Compute the translational acceleration of the rocket
%
% Source:
%   [1] Ashish Tiwari - Advanced Control of Aircraft, Spacecraft and Rockets
%   [2] Military Handbook - Missile Flight Simulation Part One: 
%       Surface-to-Air Missiles (1995)
%   [3] Kisabo - State-Space Modelling of a Rocket for Optimal Control 
%       System Design (2019)
%
% Rishav (2020/9/8)

%%% Translational Dynamics differential equation
acc_inertial = (F_a + F_p + F_g)/m; % In inertial frame
acc_body = acc_inertial - cross(omega,velocity); % Transport theorem
acceleration = acc_body; 
end