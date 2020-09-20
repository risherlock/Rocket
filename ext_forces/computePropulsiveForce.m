function [Fp] = computePropulsiveForce(m_dot,gimble_state)
% 2020/9/17

p_a = 100; % Ambient atmospheric pressure, Pa 
p_e = 100; % Average pressure across rocket nozzle exit area, Pa
V_e = 100; % Absolute velocity of exhaust gases, m/s

% Access roclet params
r = configRocket;
Ae = r.area_nozzle;

fm = -m_dot*V_e; % Momentum force
fp = (p_e - p_a)*Ae; % Pressure force
T = fm + fp; % Propulsive thrust parallel x-axis (body) 

Fp = computeControlForce(T,gimble_state);
end

