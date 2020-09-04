function [ypr_dot] = eulerKinematics(~,ypr,omegas)
%%% Kinematics equation of satellite
%
% Inputs:
%   ypr     = [yaw, pitch, roll]'
%   omegas  = Angular velocity vector of satellite
%
% Outputs:
%   ypr_dot = Derivatives of orientation
%
% Rishav (2020)
    
% yaw, pitch, roll
p = ypr(2);
r = ypr(3);

c2 = cos(p);
c3 = cos(r);
s2 = sin(p);
s3 = sin(r);


% Dynamics matrix
euler_matrix = (1/c2) * [0   s3     c3;
                         0   c3*c2  -s3*c2; 
                         c2  s3*s2  c3*s2];
                     
% Kinematics differential equation                    
ypr_dot = euler_matrix * omegas;
end