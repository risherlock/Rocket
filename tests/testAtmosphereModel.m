%%% Test of the Standard Atmosphere Model 
% 2020/10/1
clc
clear
close all

max_h = 30000; % meters
height = 0:100:max_h;

% Density, Temperature and Pressure vectors
rho = zeros(1,length(height)); 
T = zeros(1,length(height)); 
P = zeros(1,length(height)); 

for i_iters = 1:length(height)
    h = height(i_iters); 
    [rho(i_iters),T(i_iters),P(i_iters)] = atmosphereModel(h);
end

figure; plot(height,rho); grid on;
title('Height Vs Density');
xlabel('Height (meters)');
ylabel('Density (kg/m*m*m)');

figure; plot(height,T); grid on;
title('Height Vs Temperature');
xlabel('Height (meters)');
ylabel('Temperature (Pa)');

figure; plot(height,P); grid on;
title('Height Vs Pressure');
xlabel('Height (meters)');
ylabel('Pressure (kPa)');
