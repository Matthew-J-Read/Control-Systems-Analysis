%-----------------------------------------------------------------------%
%                     GNU GENERAL PUBLIC LICENSE                        %
%                       Version 3, 29 June 2007                         %
%                                                                       %
%   This function shows the efects of changing zeta on many plots       %
%                 and compare it with a 2nd Order TF                    %
%                                                                       %
%                  Copyright © 2019  Matthew J Read                     %
% ----------------------------------------------------------------------%
function UP862752_Bode_Plot_Changing_Zeta()
zeta = (0 :0.1: 1);    % Dampening ratio decrements in steps of 0.1 from 1 to 0
s = tf('s');           % Create a continuous-time transfer function model.
figure(1);
for i = 1:length(zeta) % % Forloop from 1 to 11 to plug in zeta into the equations
G = 242/((s^2)+(2*(zeta(i))*11*s)+(121)); % 2nd Order equation
bode(G) % Bode plot G
grid on % Enable Grid
hold on % Hold data
title('Bode Plot Changing Dampening Ratio','FontSize',14) % Create title
end
figure(2);
for i = 1:length(zeta) % % Forloop from 1 to 11 to plug in zeta into the equations
G = 242/((s^2)+(2*(zeta(i))*11*s)+(121)); % 2nd Order equation
step(G)         % Step response of plot G
axis([0 6 0 4]) % Set axis limits
grid on         % Enable Grid
hold on         % Hold data
title('Step Plot Changing Dampening Ratio','FontSize',14) % Create title
end
figure(3);
for i = 1:length(zeta) % % Forloop from 1 to 11 to plug in zeta into the equations
G = 242/((s^2)+(2*(zeta(i))*11*s)+(121)); % 2nd Order equation
rlocus(G)            % Root locus plot G
axis([-12 0 -50 50]) % Set axis limits
grid on              % Enable Grid
hold on              % Hold data
title('Root locus Plot Changing Dampening Ratio','FontSize',14) % Create title
end
end      % This code takes about 1 min seconds to run (depends on prossesor)
