function sim = configSimulation()
%%% Simulation parameters and initial conditions
% 2020/9/15

% Simulation time
sim.start_time = 0; % sec
sim.stop_time = 15; % sec
sim.dt = 0.01; % sec

% Initial conditions in inertial frame
init_ypy = [0.1, 0.2, 0.3];
init_omega = [0.1, 0.2, 0.3];
init_position = [0.1, 0.2, 0.3];
init_velocity = [0.1, 0.2, 0.3];
sim.init_state = [init_ypy,init_omega, ...
    init_position,init_velocity]';
end