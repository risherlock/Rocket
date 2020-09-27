function [T] = interpolatedThrust(path, time)
%%% Computes and returns interpolated thrust values from standard data set
% Standard dataset reference : https://www.thrustcurve.org/
% Basanta(2020/9/22)

persistent std_thrust_samples;
if isempty(std_thrust_samples)
    std_thrust_samples = readmatrix(path);  % Read standard thrust values
    std_thrust_samples = [0,0; std_thrust_samples];
end

T = interp1(std_thrust_samples(:,1),std_thrust_samples(:,2),time);  % Return thrust value at t = time
T(isnan(T))=0;
end
