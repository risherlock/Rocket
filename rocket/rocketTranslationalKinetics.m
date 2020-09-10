function [acc_inertial] = rocketTranslationalKinetics(~,velocity,omega,F_a,F_g,F_p)
%%% Compute the translational acceleration of the rocket in inertial frame
%
% Source:
%   [1] Ashish Tiwari - Advanced Control of Aircraft, Spacecraft and Rockets
%   [2] Military Handbook - Missile Flight Simulation Part One: 
%       Surface-to-Air Missiles (1995)
%   [3] Kisabo - State-Space Modelling of a Rocket for Optimal Control 
%       System Design (2019)
%
% Rishav (2020/9/8)

acc_body = (F_a + F_p + F_g)/m; 
acc_inertial = acc_body - cross(omega,velocity); % Transport theorem
end