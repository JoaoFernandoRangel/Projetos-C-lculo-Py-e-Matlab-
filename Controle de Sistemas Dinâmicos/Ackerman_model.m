clear all
clc
hold on
% Parameters
WheelRadius = 0.065/2; % Wheel radius in meters
TrackWidth = 0.02;  % Distance between the wheels (track width) in meters
lado = 5;
% Define the kinematic model
kinematicModel = differentialDriveKinematics('WheelRadius', WheelRadius, 'TrackWidth', TrackWidth);

% Initial conditions
ini_pos_x =  -4;
ini_pos_y = 0;
angulo = 0;
ini_orientation = atan(angulo*pi/180); % Initial orientation in radians

% Wheel speeds
W_speed_L = 20; % Left wheel speed in rad/s
W_speed_R = 30;  % Right wheel speed in rad/s
W_media = (W_speed_L + W_speed_R)/2;
% Initial state [x position, y position, orientation]
initialState = [ini_pos_x ini_pos_y ini_orientation];


if (W_media ~= 0)
    tempo_final = lado/(WheelRadius*W_media);
else
    tempo_final = 1;
end 
% Time span for the simulation
tspan = 0:0.05:tempo_final;

% Inputs (wheel speeds)
inputs = [W_speed_L W_speed_R]; % Left and right wheel speeds

% ODE solver to simulate the differential drive kinematics
[t, y] = ode45(@(t, y) derivative(kinematicModel, y, inputs), tspan, initialState);

% Plotting the trajectory
Xlim = [-(lado+1) lado+1];
Ylim = [-(lado+1) lado+1];


plot(y(:, 1), y(:, 2))
axis([Xlim Ylim]); % Define the axis limits
grid on;
xlabel('X Position');
ylabel('Y Position');
title('Differential Drive Kinematics');
