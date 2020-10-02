function [rho,T,P] = atmosphereModel(position)
%%% Implementation of International Standard Atmosphere
%
% position = Position vector of rocket in
% T = Temperature, degree Celcius
% P = Pressure, kPa
% h = Height, m
% rho = density, kg/m^3
%
% Rishav (2020/10/1)

h = norm(position);
if (h <= 11000) % Troposphere
    T = 15.04 - 0.00649*h;
    P = 101.29*((T + 273.1)/288.08)^(5.256);
elseif (h > 11000 && h <= 25000) % Lower Stratosphere
    T = -56.46;
    P = 22.65*exp(1.73 - 0.000157*h);
elseif (h > 25000) % Upper Stratosphere
    T = -131.21 + 0.00299*h;
    P = 2.488*((T + 273.1)/216.6)^(-11.388);
end

rho = P/(0.2869*(T + 273.1));
end