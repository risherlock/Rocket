%%% Simulation of the rigid body kinematics
% Rishav (2020/9/2)
clc
clear
close all

% Simulation parameters
start_time = 0;
stop_time = 5;
dt = 0.01;
time  = start_time:dt:stop_time; 

% Initial state
state = zeros(3,length(time));
omegas = [1,1,0.1]';
ypr = deg2rad([0,0,0]');
state(:,1) = ypr;

% RK4 loop
for t = 1:length(time)-1
  fn = @(t,y)rocketRotationalKinematics(t,y,omegas);
  state(:,t+1) = RK4(fn,state(:,t),dt,t);
end

% Plot
plot(time,state(1,:)); hold on;
plot(time,state(2,:)); hold on;
plot(time,state(3,:)); 
legend('Roll','Pitch','Yaw');
xlabel('Time');
ylabel('Orientation');
title('State');
