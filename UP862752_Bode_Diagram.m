%-----------------------------------------------------------------------%
%                     GNU GENERAL PUBLIC LICENSE                        %
%                       Version 3, 29 June 2007                         %
%                                                                       %
%   This code shows how to create a BODE plot from phase and freq data  %
%                                                                       %
%     https://github.com/Matthew-J-Read/Control-Systems-Analysis.git    %
%                  Copyright © 2019  Matthew J Read                     %
% ----------------------------------------------------------------------%
function UP862752_Bode_Diagram()
wdata = [0.63 2.49 6.28 9.52 13.84 20.05 25.47 32.39 37.51 44.25];     % Angular frequency
dbdata = [6.02 5.52 4.61 3.41 1.86 -1.24 -2.83 -5.78 -6.02 -7.96];     % dB gain
pdata = [-7.20 -16.64 -32.40 -45.82 -63.44 -80.43 -99.23 -111.34...    % Phase data
-110.69 -124.23];
 
tiledlayout(2,1) % Requires R2019b or later, tiled chart layout for displaying
 
% Top plot
ax1 = nexttile;
semilogx(wdata,dbdata);           % Plots line graph of gain on a semilogarithmic axis
hold on                           % Holds line plot data
semilogx(wdata,dbdata,...         % Re-plots identifying points and sets styles and sizes
'MarkerSize',10,'Marker','x',...
'LineStyle','none');
 
title(ax1,'BODE Plot Of System','FontSize',12)     % Creates a title
ylabel('Gain - dB','FontSize',12)                  % Creates a y axis label
grid(ax1,'on')                                     % Turns grid on 
axis([ 0 100 -10 10])                              % Set axis limits
 
 
% Bottom plot
ax2 = nexttile;
semilogx(wdata,pdata);            % Plots line graph of gain on a semilogarithmic axis
hold on                           % Holds line plot data
semilogx(wdata,pdata,...          % Re-plots identifying points and sets styles and sizes
'MarkerSize',10,'Marker','x',...
'LineStyle','none'); 
 
ylabel('Phase - Deg','FontSize',12)                % Creates a y axis label
xlabel('Angular Frequency – Rad/s','FontSize',12)  % Creates a x axis label
grid(ax2,'on')                                     % Turns grid on 
axis([ 0 100 -10 140])                             % Set axis limits
end
%------------------------------------------------------------------------------------------%