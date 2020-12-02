% Controll system designer to use proportinal feed back controller
clc
clear
close all

%% Step 1 Genorate dynamic mode of plant model
k = 50;
s = tf('s');
motor = 13.7/(s^2+28.53*s);
feedbackType = -1;
ForwardPath = k*motor
feedbackGain = 1;
G = feedback(k*motor , feedbackGain , feedbackType)

%% Step 2 start Controll system designer
controlSystemDesigner(G)

%% Step 3 design requiements

% Overshoot < 40%
% Rise time < 1 seconds
% Setiling time < 3 seconds
% GM > 20dB, Pm > 30deg
% Bandwidth > 5rads/s