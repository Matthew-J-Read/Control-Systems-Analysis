        %-----------------------------------------------------------------------%
        %                     GNU GENERAL PUBLIC LICENSE                        %
        %                       Version 3, 29 June 2007                         %
        %                                                                       %
        %        This code models actuator data to a 1st order system           %
        %                  Copyright © 2020  Matthew J Read                     %
        % ----------------------------------------------------------------------%
%------------------------------------------------------------------------------------------%
load set7x_1.trd            % Load Servocad7 file (amplitude data)     
data = set7x_1.';           % Convert array columns to rows
data = data(2:1:202);       % Important to ignore first data point
time = (0:0.02:4);          % Create time data points
 
K = 0.995;                  % Set gain to 0.995V
J = 0.07;                   % Set tau to 0.07 s
s = tf('s');                % Create Continuous time tf
g = K/(1+(J*s));            % 1st order tf to model actuator system
 
figure(1)
plot (time,data,'Color', 'r')     % Plot amplitude against time
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
title('Actuator Data')            
xlabel('Time (seconds)')          % Set X label
ylabel('Amplitude (Volts)')       % Set Y label
[y,x] = step(g*5,4);              % Return 5v step data up to 4 seconds
plot(x,y,'Color', 'b')            % Plot amplitude against time
 
figure(2)
Amean = movmean(data(13:1:201),20);  % Isolate noise and apply 20 pont moving average filter
Amean = [data(1:1:12) Amean];        % combine rise time data with reduced noise data
plot (time,Amean,'Color', 'r')       % Plot amplitude against time
hold on                              % Hold data
grid on                              % Enable grid lines
grid(gca,'minor')                    % Enable minor grid lines
ax = gca;                            % Get handle to current axes
ax.GridColor = [0.1, 0.7, 0.2];      % Dark green grid
ax.GridAlpha = 1;                    % Make grid lines less transparent
ax.MinorGridColor = ax.GridColor;    % Dark green minor grid
ax.MinorGridLineStyle = '-';         % Set minor grid lines solid 
ylim([0 7])                          % Set Y limit
xlim([0 4])                          % Set X limit
title('Actuator Data reduced noise') % Set title
xlabel('Time (seconds)')             % Set X label
ylabel('Amplitude (Volts)')          % Set Y label
plot(x,y,'Color', 'b')               % Plot amplitude against time
%------------------------------------------------------------------------------------------%