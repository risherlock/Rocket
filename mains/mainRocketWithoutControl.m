%%% Rocket simulation without TVC
% Rishav (2020/9/7)

clc
clear 
close all

sim = configSimulation; % Access simulation params
time  = sim.start_time:sim.dt:sim.stop_time; 

% Initial state vector
state = zeros(12,length(time));
state(:,1) = sim.init_state;

% No movement of gimble
gimble_state = [0,0]; % Radians

% RK4 loop
for t = 1:length(time)-1
  fn = @(t,y)rocketDynamicalModel(t,y,gimble_state);
  state(:,t+1) = RK4(fn,state(:,t),sim.dt,t);
end