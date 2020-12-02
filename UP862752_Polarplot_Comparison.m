%-----------------------------------------------------------------------%
%                     GNU GENERAL PUBLIC LICENSE                        %
%                       Version 3, 29 June 2007                         %
%                                                                       %
% This code shows how to create a Nyquist plot from phase and freq data %
%                 and compare it with a 1st and 2nd Order TF            %
%                                                                       %
%                  Copyright © 2019  Matthew J Read                     %
% ----------------------------------------------------------------------%

function UP862752_Polarplot_Comparison()
w = (0:0.1:1000);                      % Omega from 0 to 1000 incrementing in 0.1                 
Magnitude_Response_1 = zeros(size(w)); % Pre-define array size and fill with zeros  
Phase_Response_1     = zeros(size(w)); % Pre-define array size and fill with zeros
Magnitude_Response_2 = zeros(size(w)); % Pre-define array size and fill with zeros  
Phase_Response_2     = zeros(size(w)); % Pre-define array size and fill with zeros
 
dbdata = [6.02 5.52 4.61 3.41 1.86 -1.24 -2.83 -5.78 -6.02 -7.96];     % dB gain
pdata = [-7.20 -16.64 -32.40 -45.82 -63.44...                          % Phase data
         -80.43 -99.23 -111.34 -110.69 -124.23];
gdata = zeros(size(dbdata));      % Pre-define array size and fill with zeros  
for i=1:length(dbdata)            % For loop from 1 to 10
    gdata(i) = 10^(dbdata(i)/20); % Convert Db gain to linear gain
end
 
for i = 1:length(w)                                  % Forloop from 1 to 1000 to plug in Omega into the equations
Magnitude_Response_1(i) = 22/(sqrt(121+((w(i))^2))); % Mag_Response = |22|/|jw+11|
Phase_Response_1(i)     = (-atan(w(i)/11));          % Phase_Response = - arctan(w/11)
Magnitude_Response_2(i) = 1058/sqrt(((529-(w(i))^2)^2)+((59.8*w(i))^2)); % 2nd order Mag_Response
Phase_Response_2(i)     = (-atan((59.8*w(i))/(529-(w(i))^2)));          % 2nd order Phase_Response
end
 
for i = 232:length(w)                            % Forloop from 232 to 1000 (Principal solution)
 Phase_Response_2(i) = Phase_Response_2(i) - pi; % Subtract pi Rad or 180 from array position 13 onwards
end
 
figure('WindowState','fullscreen')                   % Create figure 2 full screen
polarplot(Phase_Response_1,Magnitude_Response_1,...  % Polar plot Theta and Rho and config line style
'Linewidth',2,'MarkerSize',10);
title('Polar Plot of 1st and 2nd Order Systems');    % Create title
hold on
Phase_Response_Rad = deg2rad(pdata);                 % Convert back from deg to rad to polar plot
polarplot(Phase_Response_Rad,gdata,...               % Polar plot sin data
          '-x','Linewidth',2,'MarkerSize',10);
title('Polar Plot Of All Systems And Data');         % Create title
 
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
 
i = (0.5 : 0.5 : 2);               % Create array with data incrementing in 0.5 from 0.5 to 2  
rticks(0 : 0.5 : 2);               % Create 4 Magnitude (Rho) positions 
rticklabels({'',i});               % Creates Omega labels every 0.5 increment in magnitude
hold on
 polarplot(Phase_Response_2,Magnitude_Response_2,... % Polar plot Theta and Rho and config line style
'Linewidth',2,'MarkerSize',10);
end