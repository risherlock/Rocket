%%% Rocket simulation without TVC
% Rishav (2020/9/7)
clc
clear 
close all

fprintf('Simulation in progress... \n');
sim = configSimulation; % Access simulation params

% State vectors
state = zeros(length(sim.init_state),length(sim.time));
state(:,1) = sim.init_state;

% Initialise gimble
gimble_state = sim.init_gimble_state;

% RK4 loop
for i_iters = 1:length(sim.time)-1 
  t = sim.time(i_iters);
    
  % gimble_state = thrustVectorControl(); % Control 
  fn = @(t,y)rocketDynamicalModel(t,y,gimble_state); % Plant
  state(:,i_iters+1) = RK4(fn,state(:,i_iters),sim.dt,t); % Store states
end

plotRocketStates(sim.time,state); 
clc; fprintf('Simulation complete... \n');
