%%% Rocket simulation without TVC
% Rishav (2020/9/7)

clc
clear 
close all

fprintf('Simulation in progress...');
sim = configSimulation; % Access simulation params
time  = sim.start_time:sim.dt:sim.stop_time; 

% State vectors
state = zeros(length(sim.init_state),length(time));
state(:,1) = sim.init_state;

% Initialise gimble
gimble_state = sim.init_gimble_state;

% RK4 loop
for t = 1:length(time)-1 
  % gimble_state = thrustVectorControl(); % Control 
  fn = @(t,y)rocketDynamicalModel(t,y,gimble_state); % Plant
  state(:,t+1) = RK4(fn,state(:,t),sim.dt,t); % Store states
end

plot(time,state(1,:)); hold on;
plot(time,state(2,:)); hold on;
plot(time,state(3,:)); hold on;

clc; 
fprintf('Simulation complete... \n');