function [m_dot] = computeMassFlowRate(thrust)
%%% Computes and returns mass flow rate at a given instant of time
% Basanta(2020/10/1)

g0 = 9.8; % m/s^2
r = configRocket();

m_dot =  -thrust/(g0*r.motor_sp_impulse);
end
