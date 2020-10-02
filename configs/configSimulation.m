function sim = configSimulation()
%%% Simulation parameters and initial conditions
% 2020/9/15

% Simulation time
start_time = 0; % sec
stop_time = 45; % sec
sim.dt = 0.01; % sec
sim.time  = start_time:sim.dt:stop_time; 

r = configRocket();
% Initial conditions in inertial frame
init_mass = r.mass;
init_ypy = [0, 0, 0]; % radians
init_omega = [0, 0, 0]; % rad/sec
init_position = [0, 0, 0]; % m
init_velocity = [0, 0, 0]; % m/s
sim.init_state = [init_ypy, init_omega, ...
    init_position,init_velocity,init_mass]'; % State vector, 12x1
sim.init_gimble_state = [0,0]; % radians
end