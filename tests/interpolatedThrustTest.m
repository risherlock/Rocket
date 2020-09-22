%%% Test case for interpolated thrust output
% Scatter plot of interpolated thrust output with very small dt
%Basanta(2020/9/22)
    clc
    clear
    close all

% Duration Parameters
    start_time = 0;
    stop_time = 5;
    dt = 0.001;
    time  = start_time:dt:stop_time;

% Interpolated thrust extraction

    % Estes_F15 motor
    thrust_Estes_F15 = interpolatedThrust('/configs/Motors/Estes_F15.csv',time);  %Thrust Extraction
    std_Estes_F15 = readmatrix('/configs/Motors/Estes_F15.csv');    %Standard Thrust Samples Extraction
    std_Estes_F15 = [0,0; std_Estes_F15];

    % Estes_E12 motor
    thrust_Estes_E12 = interpolatedThrust('/configs/Motors/Estes_E12.csv',time);  %Thrust Extraction
    std_Estes_E12 = readmatrix('/configs/Motors/Estes_E12.csv');    %Standard Thrust Samples Extraction
    std_Estes_E12 = [0,0; std_Estes_E12];
    
    % AeroTech_G80T motor
    thrust_AeroTech_G80T = interpolatedThrust('/configs/Motors/AeroTech_G80T.csv',time);  %Thrust Extraction
    std_AeroTech_G80T = readmatrix('/configs/Motors/AeroTech_G80T.csv');    %Standard Thrust Samples Extraction
    std_AeroTech_G80T = [0,0; std_AeroTech_G80T];

    % AeroTech_K550W motor
    thrust_AeroTech_K550W = interpolatedThrust('/configs/Motors/AeroTech_K550W.csv',time);  %Thrust Extraction
    std_AeroTech_K550W = readmatrix('/configs/Motors/AeroTech_K550W.csv');    %Standard Thrust Samples Extraction
    std_AeroTech_K550W = [0,0; std_AeroTech_K550W];
    
    
% Scatter Plot
    
    % Estes_F15 motor
    figure(1)
    p = plot(std_Estes_F15(:,1),std_Estes_F15(:,2),'-g'); hold on;
    p.LineWidth = 3;
    scatter(time,thrust_Estes_F15,10,'.','r');
    legend('Standard','Extracted');
    xlabel('Time');
    ylabel('Thrust');
    title('Thrust Curve Estes F15');
    
    % Estes_E12 motor
    figure(2)
    p = plot(std_Estes_E12(:,1),std_Estes_E12(:,2),'-g'); hold on;
    p.LineWidth = 3;
    scatter(time,thrust_Estes_E12,10,'.','r');
    legend('Standard','Extracted');
    xlabel('Time');
    ylabel('Thrust');
    title('Thrust Curve Estes E12');
    
    % AeroTech_G80T motor
    figure(3)
    p = plot(std_AeroTech_G80T(:,1),std_AeroTech_G80T(:,2),'-g'); hold on;
    p.LineWidth = 3;
    scatter(time,thrust_AeroTech_G80T,10,'.','r');
    legend('Standard','Extracted');
    xlabel('Time');
    ylabel('Thrust');
    title('Thrust Curve AeroTech G80T');
    
    % AeroTech_K550W motor
    figure(4)
    p = plot(std_AeroTech_K550W(:,1),std_AeroTech_K550W(:,2),'-g'); hold on;
    p.LineWidth = 3;
    scatter(time,thrust_AeroTech_K550W,10,'.','r');
    legend('Standard','Extracted');
    xlabel('Time');
    ylabel('Thrust');
    title('Thrust Curve AeroTech K550W');