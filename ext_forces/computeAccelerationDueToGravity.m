function [g] = computeAccelerationDueToGravity(position)
%%% Compute gravitational force in body frame
% Rishav (2020/9/8)
% Basanta (2020/10/06)

go = 9.8; % m/s^2
Re = 6371000; % m
h = norm(position); % m
g = go*(Re^2/(Re+h)^2); % g at h
end
