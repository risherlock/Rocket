function [acc_inertial] = ...
    rocketTranslationalKinetics(~,ypr,mass,F_a,F_p)
%%% Compute the translational acceleration of the rocket in inertial frame
% Rishav (2020/9/8)
% Basanta (2020/10/07)

acc_body = (F_a + F_p)/mass;
acc_inertial = (dcm321Euler(ypr(1),ypr(2),ypr(3)))' * acc_body; %Transformation of acc from body to inertial frame
end