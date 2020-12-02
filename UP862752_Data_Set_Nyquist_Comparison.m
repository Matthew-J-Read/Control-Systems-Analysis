%-----------------------------------------------------------------------%
%                     GNU GENERAL PUBLIC LICENSE                        %
%                       Version 3, 29 June 2007                         %
%                                                                       %
% This code shows how to create a Nyquist plot from phase and freq data %
%                 and compare it with a 1st Order TF                    %
%                                                                       %
%                  Copyright © 2019  Matthew J Read                     %
% ----------------------------------------------------------------------%
function UP862752_Data_Set_Nyquist_Comparison()
dbdata = [6.02 5.52 4.61 3.41 1.86 -1.24 -2.83 -5.78 -6.02 -7.96]; % dB gain
pdata = [-7.20 -16.64 -32.40 -45.82 -63.44 -80.43 -99.23 -111.34...
         -110.69 -124.23];
gdata = zeros(size(dbdata));      % Pre-define array size and fill with zeros  
for i=1:length(dbdata)            % For loop from 1 to 10
    gdata(i) = 10^(dbdata(i)/20); % Convert Db gain to linear gain
end
pdata = deg2rad(pdata);           % Convert phase data to radians   
g = tf(22,[1 11]);                % First order transfer function
P = nyquistoptions;               % Returns the default options for Nyquist plots
P.ShowFullContour = 'off';        % Disables response for negative frequencies
nyquistplot(g,P);                 % Plots 1st order system
grid on                           % Enable grid
hold on                           % Hold data
[x,y] = pol2cart(pdata,gdata);    % Convert to Cartesian form
plot(x,y,'k')                     % Plot black line
plot(x,y,'x','MarkerSize',12)     % Mark data poins with a cross
title('Nyquist Data Comparison','FontSize',14) % Create title
xlabel('Real Axis','FontSize',12)              % Create X-axis lable          
ylabel('Imaginary Axis','FontSize',12)         % Create Y-axis lable
axis([-0.5 2.1 -1.2 0.4])                      % Set axis limits
end
% ----------------------------------------------------------------------%
