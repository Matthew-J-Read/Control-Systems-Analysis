%-----------------------------------------------------------------------%
%                     GNU GENERAL PUBLIC LICENSE                        %
%                       Version 3, 29 June 2007                         %
%                                                                       %
%          This code tabulates magnitude and phase responce data        %
%                                                                       %
%                  Copyright © 2019  Matthew J Read                     %
% ----------------------------------------------------------------------%

function UP862752_Polar_Table()
w = [0 1 2 4 8 16 32 64 128 256 512];  % Omega from 0 to 512 incrementing in binary                   
Magnitude_Response_1 = zeros(size(w)); % Pre-define array size and fill with zeros  
Phase_Response_1     = zeros(size(w)); % Pre-define array size and fill with zeros
Magnitude_Response_2 = zeros(size(w)); % Pre-define array size and fill with zeros  
Phase_Response_2     = zeros(size(w)); % Pre-define array size and fill with zeros
 
 
for i = 1:length(w)                                  % Forloop from 1 to 7 to plug in Omega into the equations
Magnitude_Response_1(i) = 22/(sqrt(121+((w(i))^2))); % Mag_Response = |22|/|jw+11|
Phase_Response_1(i)     = rad2deg(-atan(w(i)/11));   % Phase_Response = - arctan(w/11)
Magnitude_Response_2(i) = 242/sqrt(((121-(w(i))^2)^2)+((15.57*w(i))^2));
Phase_Response_2(i)     = rad2deg(-atan((15.57*w(i))/(121-(w(i))^2))); 
end
 
for i = 6:length(w)                               % Forloop from 112 to 1000 (Principal solution)
 Phase_Response_2(i) = Phase_Response_2(i) - 180; % Subtract pi Rad or 180 from array position 13 onwards
 
end
 
f = figure(2);                          % Create figure 1
set(f,'Position',[500 500 770 230]);    % Sets position of figure 1
data...                                 % Tabulates data for all mag and phase for omega binary incrementing
=  {w(1),  Magnitude_Response_1(1),  Phase_Response_1(1),  Magnitude_Response_2(1),  Phase_Response_2(1);...
    w(2),  Magnitude_Response_1(2),  Phase_Response_1(2),  Magnitude_Response_2(2),  Phase_Response_2(2);...   
    w(3),  Magnitude_Response_1(3),  Phase_Response_1(3),  Magnitude_Response_2(3),  Phase_Response_2(3);...
    w(4),  Magnitude_Response_1(4),  Phase_Response_1(4),  Magnitude_Response_2(4),  Phase_Response_2(4);...
    w(5),  Magnitude_Response_1(5),  Phase_Response_1(5),  Magnitude_Response_2(5),  Phase_Response_2(5);...
    w(6),  Magnitude_Response_1(6),  Phase_Response_1(6),  Magnitude_Response_2(6),  Phase_Response_2(6);...
    w(7),  Magnitude_Response_1(7),  Phase_Response_1(7),  Magnitude_Response_2(7),  Phase_Response_2(7);...
    w(8),  Magnitude_Response_1(8),  Phase_Response_1(8),  Magnitude_Response_2(8),  Phase_Response_2(8);...
    w(9),  Magnitude_Response_1(9),  Phase_Response_1(9),  Magnitude_Response_2(9),  Phase_Response_2(9);...
    w(10), Magnitude_Response_1(10), Phase_Response_1(10), Magnitude_Response_2(10), Phase_Response_2(10);};
     
columnname =   {' Omega (Rad/s) ', '1st Order Magnitude',...       % Create variable names in table
                '1st Order Phase (deg)','2nd Order Magnitude',...
                '2nd Order Phase (deg)'};                          
uitable('Units','normalized','Position',[0.05 0.05 0.755 0.87],... % Create table user interface component 
        'Data', data,'ColumnName', columnname,'RowName',[]);        
end