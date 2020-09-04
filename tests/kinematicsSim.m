%%% Simulation of the rigid body kinematics
% Rishav (2020/9/2)
clc
clear
close all

% Simulation parameters
start_time = 0;
stop_time = 5000;
dt = 1;
time  = start_time:dt:stop_time; 

% Initial state
state = zeros(3,length(time));
omegas = [1,0.02,0.01]';
rpy = [0.1,0.1,0.1]';
state(:,1) = rpy;

% RK4 loop
for t = 1:length(time)-1
  fn = @(t,y)eulerKinematics(t,y,omegas);
  state(:,t+1) = RK4(fn,state(:,t),dt,t);
end

% Plot
plot(time,state(1,:)); hold on;
plot(time,state(2,:)); hold on;
plot(time,state(3,:)); 
xlabel('Time');
ylabel('Amplitude');
title('Simple Pendulum');

max(state(1,:))
max(state(2,:))
max(state(3,:))