%-----------------------------------------------------------------------%
%                     GNU GENERAL PUBLIC LICENSE                        %
%                       Version 3, 29 June 2007                         %
%                                                                       %
%   This code shows how to import ServoCad7.trd files + noise reduction %
%                                                                       %
%     https://github.com/Matthew-J-Read/Control-Systems-Analysis.git    %
%                  Copyright © 2020  Matthew J Read                     %
% ----------------------------------------------------------------------%    
load set7x_1.trd            % Load Servocad7 file (amplitude data)     
data = set7x_1.';           % Convert array columns to rows
data = data(2:1:202);       % Important to ignore first data point
time = (0:0.02:4);          % Create time data points
 
subplot(2,1,1)                    % Create subplot
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
title('Actuator Data')            % Set title
xlabel('Time (seconds)')          % Set X label
ylabel('Amplitude (Volts)')       % Set Y label
 
subplot(2,1,2)                       % Create subplot
Amean = movmean(data(13:1:201),20);  % Isolate noise and apply 20 pont moving average filter
Amean = [data(1:1:12) Amean];        % combine rise time data with reduced noise data
plot (time,Amean,'Color', 'r')       % Plot amplitude against time
grid on                              % enable grid lines
grid(gca,'minor')                    % Enable minor grid lines
ax = gca;                            % Get handle to current axes
ax.GridColor = [0.1, 0.7, 0.2];      % Dark green grid
ax.GridAlpha = 1;                    % Make grid lines less transparent
ax.MinorGridColor = ax.GridColor;    % Dark green minor grid
ax.MinorGridLineStyle = '-';         % Set minor grid lines solid 
ylim([0 7])                          % Set Y limit
xlim([0 4])                          % Set X limit
title('Actuator Data Reduced Noise') % Set title
xlabel('Time (seconds)')             % Set X label
ylabel('Amplitude (Volts)')          % Set Y label
% ----------------------------------------------------------------------%    