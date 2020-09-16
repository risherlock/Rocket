function [acc_inertial] = ...
    rocketTranslationalKinetics(~,velocity,omega,mass,F_a,F_g,F_p)
%%% Compute the translational acceleration of the rocket in inertial frame
% 2020/9/8

acc_body = (F_a + F_p + F_g)/mass;
acc_inertial = acc_body - cross(omega,velocity); % Transport theorem
end