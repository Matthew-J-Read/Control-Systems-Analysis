        %-----------------------------------------------------------------------%
        %                     GNU GENERAL PUBLIC LICENSE                        %
        %                       Version 3, 29 June 2007                         %
        %                                                                       %
        %  This code shows the changing the gain of a diff in the feedback path %
        %                                                                       %
        %     https://github.com/Matthew-J-Read/Control-Systems-Analysis.git    %
        %                  Copyright © 2020  Matthew J Read                     %
        % ----------------------------------------------------------------------%
%-----------------------------------------------------------------------------------------%
load set7x_2.trd            % Load Servocad7 file (amplitude data)
data = set7x_2.';           % Convert array columns to rows
data = data(2:1:202);       % Important to ignore first data point
time = (0:0.02:4);          % Create time data points 0.02 = 1/fs = Ts 

plot(time,data)                   % Plot amplitude against time
hold on                           % Hold data
grid on                           % Enable grid lines
grid(gca,'minor')                 % Enable minor grid lines
ax = gca;                         % Get handle to current axes
ax.GridColor = [0.1, 0.7, 0.2];   % Dark green grid
ax.GridAlpha = 1;                 % Make grid lines less transparent
ax.MinorGridColor = ax.GridColor; % Dark green minor grid
ax.MinorGridLineStyle = '-';      % Set minor grid lines solid 
ylim([0 7])                       % Set Y limit
xlim([0 4])                       % Set X limit 
title('Effects of changing Feedback Gain Block (Kt)') % Set title
xlabel('Time (seconds)')          % Set X lable
ylabel('Amplitude (Volts)')       % Set Y lable

s = tf('s');                      % Create Continuous time tf

gain = 1.003;                                % gainBlock 
J = 0.07;                                    % Set tau to 0.07 s
g = gain/(1+(J*s));                          % 1st order tf to model actuator system
Wn = 30;                                     % Natural frequency = 30 rad/s
Z = 0.065;                                   % Set zeta to 0.065 
G = (gain*(Wn^2))/((s^2)+(2*Z*Wn*s)+(Wn^2)); % 2nd order tf to model actuator system

Openloop = (g*G);                                 % Openloop Servoset system
Fgain = [0.05 0.1 0.3 0.5];                       % Feedback GainBlock                  
Diff = s;                                         % Velocity FeedbackBlock

for i = 1:1:length(Fgain)                            % Loop 11 times
Closedloop = feedback(Openloop,(Fgain(i)*Diff),-1);  % Add feedback path
[y,x] = step(Closedloop*5,4);                        % Return 5v step data upto 4 seconds
plot(x,y)                                            % Plot amplitude against time
hold on                                              % Hold data
end
%-----------------------------------------------------------------------------------------%