%-----------------------------------------------------------------------%
%                     GNU GENERAL PUBLIC LICENSE                        %
%                       Version 3, 29 June 2007                         %
%                                                                       %
% This code shows how to create a Nyquist plot from phase and freq data %
%                 and compare it with a 1st and 2nd Order TF            %
%                                                                       %
%     https://github.com/Matthew-J-Read/Control-Systems-Analysis.git    %
%                                                                       %
%                  Copyright © 2019  Matthew J Read                     %
% ----------------------------------------------------------------------%
function UP862752_Polarplot_With_Table()
dbdata = [6.02 5.52 4.61 3.41 1.86 -1.24 -2.83 -5.78 -6.02 -7.96];     % dB gain
pdata = [-7.20 -16.64 -32.40 -45.82 -63.44...                          % Phase data
         -80.43 -99.23 -111.34 -110.69 -124.23];
gdata = zeros(size(dbdata));      % Pre-define array size and fill with zeros  
for i=1:length(dbdata)            % For loop from 1 to 10
    gdata(i) = 10^(dbdata(i)/20); % Convert Db gain to linear gain
end
w = [0 1 2 4 8 16 32 64 128 256];    % Various values of Omega          
Magnitude_Response = zeros(size(w)); % Pre-define array size and fill with zeros  
Phase_Response = zeros(size(w));     % Pre-define array size and fill with zeros
 
for i = 1:length(w)                                % For loop from 1 to 7 to plug in Omega into the equations
Magnitude_Response(i) = 22/(sqrt(121+((w(i))^2))); % Mag_Response = |22|/|jw+11|
Phase_Response(i) = rad2deg(-atan(w(i)/11));       % Phase_Response = - arctan(w/11)
end
 
f = figure(1);                                          % Create figure 1
set(f,'Position',[500 500 345 220]);                    % Sets position of figure 1
data...                                                 % Tabulates data for all mag and phase values
=  {w(1),  Magnitude_Response(1), Phase_Response(1);...
    w(2),  Magnitude_Response(2), Phase_Response(2);...   
    w(3),  Magnitude_Response(3), Phase_Response(3);...
    w(4),  Magnitude_Response(4), Phase_Response(4);...
    w(5),  Magnitude_Response(5), Phase_Response(5);...
    w(6),  Magnitude_Response(6), Phase_Response(6);...
    w(7),  Magnitude_Response(7), Phase_Response(7);...
    w(8),  Magnitude_Response(8), Phase_Response(8);...
    w(9),  Magnitude_Response(9), Phase_Response(9);...
    w(10), Magnitude_Response(10),Phase_Response(10);};
     
columnname =   {' Omega (Rad/s) ', 'Magnitude', 'Phase (deg)'};     % Create variable names in table
uitable('Units','normalized','Position',[0.05 0.05 0.755 0.87],...  % Create table user interface component 
        'Data', data,'ColumnName', columnname,'RowName',[]);        
 
figure('WindowState','fullscreen')                   % Create figure 2 full screen
Phase_Response_Rad = deg2rad(Phase_Response);        % Convert back from deg to rad to polar plot
polarplot(Phase_Response_Rad,Magnitude_Response,...  % Polar plot Theta and Rho and config line style
          '-x','Linewidth',2,'MarkerSize',10);
hold on
Phase_Response_Rad = deg2rad(pdata);        % Convert back from deg to rad to polar plot
polarplot(Phase_Response_Rad,gdata,...      % Polar plot sin data
          '-x','Linewidth',2,'MarkerSize',10);
title('Polar Plot of G(s)');                         % Create title
 
i = (-360:10:0);                   % Create array with data incrementing in 10 from -360 to 0 
i(1) = 0;                          % Set the first position in the array (-360) to 0 where polar plot starts
thetaticks(0 : 10 : 360);          % Create 36 angle positions around the polar plot perimeter
thetaticklabels({i});              % Label the 36 angle positions with the data in array ladled 'i'
 
polar = gca;                       % Returns the current axes or chart for the polar plot
polar.FontSize = 16;               % Set font size to 16
polar.FontWeight = 'bold';         % Set font style to bold
polar.RMinorGrid = 'on';           % Enable Phase (Theta) minor grid for greater resolution in data reading
polar.MinorGridLineStyle = '-';    % Set minor grid line style from dotted to a solid line
polar.GridAlpha = 0.5;             % Set transparency of main grid
polar.MinorGridAlpha = 0.1;        % Set transparency of minor grid
polar.ThetaMinorGrid = 'on';       % Enable Magnitude (Rho) minor grid for greater resolution in data reading
polar.RColor = [0 0.5 0];          % Set 'w' (Rho) labels to green RGB value of {R=0 G=0.5 B=0}
 
i = (0.5 : 0.5 : 2);      % Create array with data incrementing in 0.5 from 0.5 to 2  
rticks(0 : 0.5 : 2);      % Create 4 Magnitude (Rho) positions 
rticklabels({'',i});      % Creates Omega labels every 0.5 increment in magnitude
end
 
 
 


