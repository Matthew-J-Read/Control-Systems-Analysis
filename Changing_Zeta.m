          %-----------------------------------------------------------------------%
          %                     GNU GENERAL PUBLIC LICENSE                        %
          %                       Version 3, 29 June 2007                         %
          %                                                                       %
          %             This code shows the efect of changing zeta                %
          %                                                                       %
          %     https://github.com/Matthew-J-Read/Control-Systems-Analysis.git    %
          %                  Copyright © 2020  Matthew J Read                     %
          % ----------------------------------------------------------------------%
%--------------------------------------------------------------------------------------------%
clear
load set7x_1.trd            % Load Servocad7 file (amplitude data)     
data = set7x_1.';           % Convert array columns to rows
data = data(2:1:202);       % Important to ignore first data point
time = (0:0.02:4);          % Create time data points
 
subplot(2,1,1)                 % Create subplot
 
Kss = 0.995;                   % Set gain to 0.995V
Wn = 25;                       % Natural frequency = 25 rad/s
s = tf('s');                   % Create Continuous time tf
Z = (1:-0.01:0.707);           % Set zeta to 1 
 
for i = 1:1:length(Z)          % Loop 21 times
g = (Kss*(Wn^2))/((s^2)+(2*Z(i)*Wn*s)+(Wn^2)); % 2nd order tf to model actuator system
[y,x] = step(g*5,4);                           % Return 5v step data up to 4 seconds
plot(x,y)                                      % Plot amplitude against time
hold on
end
 
plot (time,data,'LineWidth',...
      2,'Color', 'k')             % Plot amplitude against time
hold on                           % Hold data
grid on                           % Enable grid lines
grid(gca,'minor')                 % Enable minor grid lines
ax = gca;                         % Get handle to current axes
ax.GridColor = [0.1, 0.7, 0.2];   % Dark green grid
ax.GridAlpha = 1;                 % Make grid lines less transparent
ax.MinorGridColor = ax.GridColor; % Dark green minor grid
ax.MinorGridLineStyle = '-';      % Set minor grid lines solid 
ylim([0 5])                       % Set Y limit
xlim([0 0.22])                    % Set X limit 
title('Changing Zeta')            % Set title
xlabel('Time (seconds)')          % Set X label
ylabel('Amplitude (Volts)')       % Set Y label
 
subplot(2,1,2)                                 % Create subplot
for i = 1:1:length(Z)                          % Loop 21 times
g = (Kss*(Wn^2))/((s^2)+(2*Z(i)*Wn*s)+(Wn^2)); % 2nd order tf to model actuator system
[y,x] = step(g*5,4);                           % Return 5v step data up to 4 seconds
plot(x,y)                                      % Plot amplitude against time
hold on
end
 
plot (time,data,'LineWidth',...
      2,'Color', 'k')             % Plot amplitude against time
hold on                           % Hold data
grid on                           % Enable grid lines
grid(gca,'minor')                 % Enable minor grid lines
ax = gca;                         % Get handle to current axes
ax.GridColor = [0.1, 0.7, 0.2];   % Dark green grid
ax.GridAlpha = 1;                 % Make grid lines less transparent
ax.MinorGridColor = ax.GridColor; % Dark green minor grid
ax.MinorGridLineStyle = '-';      % Set minor grid lines solid 
ylim([0 7])                       % Set Y limit
xlim([0 1])                       % Set X limit 
title('Changing Zeta')            % Set title
xlabel('Time (seconds)')          % Set X label
ylabel('Amplitude (Volts)')       % Set Y label
%--------------------------------------------------------------------------------------------%