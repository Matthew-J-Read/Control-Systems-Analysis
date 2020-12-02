%-----------------------------------------------------------------------%
%                     GNU GENERAL PUBLIC LICENSE                        %
%                       Version 3, 29 June 2007                         %
%                                                                       %
%   This code shows how to create a BODE plot from phase and freq data  %
%                 and compare it with a 1st Order TF                    %
%                                                                       %
%                  Copyright © 2019  Matthew J Read                     %
% ----------------------------------------------------------------------%
%------------------------------------------------------------------------------------------%
function UP862752_Bode_Diagram_Compare()
wdata = [0.63 2.49 6.28 9.52 13.84 20.05 25.47 32.39 37.51 44.25];  % Angular frequency
dbdata = [6.02 5.52 4.61 3.41 1.86 -1.24 -2.83 -5.78 -6.02 -7.96];  % dB gain
pdata = [-7.20 -16.64 -32.40 -45.82 -63.44...                       % Phase data (Deg)
-80.43 -99.23 -111.34 -110.69 -124.23];
 
s = tf('s');                      % Create a continuous-time transfer function model.
k = 2;                            % K = 6dB or voltage gain of 2
tau = (1/11);                     % Cut off frequency happens at 11 rad/s
g = (k/(1+(tau*s)));              % g = (22/(s+11))
%------------------------------------------------------------------------------------------%
tiledlayout(2,1)                  % Requires R2019b, tiled chart layout for displaying multiple plots 
ax1 = nexttile;                   % Top plot
w = logspace(-0.2,1.7);           % Set limits to continuous-time transfer function g in top plot  
[m,~] = bode(g,w);                % Get magnitude data for the TF
dbm = 20*log10(m);                % Convert from linear mag to dB 
hold off                          % Clears data
semilogx(w,dbm(:,:) )             % Plots row, column (not layer) data of dbm with w limits  
hold on                           % holds data
semilogx(wdata,dbdata);           % Plots line graph of gain on a semilogarithmic axis
hold on                           % Holds line data
semilogx(wdata,dbdata,...         % Re-plots identifying points and sets styles and sizes
'MarkerSize',10,'Marker','x',...
'LineStyle','none');
title(ax1,'Comparason BODE Plot Of System','FontSize',12) % Creates a title
ylabel('Gain - dB','FontSize',12)                         % Creates a y axis label
grid(ax1,'on')                                            % Turns grid on 
axis([ 0.5 100 -10 10])                                   % Set axis limits
ax2 = nexttile;                   % Bottom plot
[~,p] = bode(g,w);                % get phase data for the TF, in order to plot it manually
hold off                          % Clears data
semilogx(w,p(:,:))                % Plots row, column (not layer) data of phase data with w limits
hold on                           % holds data
semilogx(wdata,pdata);            % Plots line graph of gain on a semilogarithmic axis
hold on                           % Holds line plot data
semilogx(wdata,pdata,...          % Re-plots identifying points and sets styles and sizes
'MarkerSize',10,'Marker','x',...
'LineStyle','none'); 
ylabel('Phase - Deg','FontSize',12)               % Creates a y axis label
xlabel('Angular Frequency - Rad/s','FontSize',12) % Creates a x axis label
grid(ax2,'on')                                    % Turns grid on 
axis([ 0.5 100 -140 10])                            % Set axis limits
end
%------------------------------------------------------------------------------------------%



