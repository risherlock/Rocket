function [tau] = computeControlMoment(thrust,gimble_state)
% Rishav (2020/9/8)    

% Access rocket params
rocket = configRocket;

% Unpack gimble angle (radians)
mu_1 = gimble_state(1);
mu_2 = gimble_state(2);

% Control moment
tau_x = 0;
tau_y = -thrust*rocket.xi*sin(mu_1);
tau_z = thrust*rocket.xi*cos(mu_1)*sin(mu_2);

tau = [tau_x,tau_y,tau_z]';
end