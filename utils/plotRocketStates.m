function [] = plotRocketStates(time,state)
% 2020/10/1

s = state;

figure(1); plot(time,s(1:3,:),'LineWidth',1.5); % Orientation
title('Orientation of rocket in inertial frame');
xlabel('time (secs)'); ylabel('radians');
legend('x-axis','y-axis','z-axis'); grid on;

figure(2); plot(time,s(4:6,:),'LineWidth',1.5); % Angular rates
title('Angular rates of rocket in inertial frame');
xlabel('time (secs)'); ylabel('radians/sec');
legend('Yaw','Pitch','Roll'); grid on;

figure(3); plot(time,s(7:9,:),'LineWidth',1.5); % Position
title('Position of rocket in inertial frame');
xlabel('time (secs)'); ylabel('meters');
legend('x-axis','y-axis','z-axis'); grid on;

e = length(s(9,:));
figure(4); plot3(s(9,:),s(8,:),s(7,:),'LineWidth',3); % Position vector
title('Position vector of rocket in inertial frame'); hold on;
text(s(9,1),s(8,1),s(7,1),'START'); text(s(9,e),s(8,e),s(7,e),'END');
xlabel('z-axis'); ylabel('y-axis'); zlabel('x-axis'); grid on;

figure(5); plot(time,s(10:12,:),'LineWidth',1.5); % Velocity
title('Velocity of rocket in inertial frame');
xlabel('time (secs)'); ylabel('m/s');
legend('x-axis','y-axis','z-axis'); grid on;
end
