%-----------------------------------------------------------------------%
%                     GNU GENERAL PUBLIC LICENSE                        %
%                       Version 3, 29 June 2007                         %
%                                                                       %
%       This simple script shows the root locus of a 2nd order tf       %
%                                                                       %
%     https://github.com/Matthew-J-Read/Control-Systems-Analysis.git    %
%                                                                       %
%                  Copyright © 2019  Matthew J Read                     %
% ----------------------------------------------------------------------%
function UP862752_System_Pole_Positions()
SecondOrder = tf(1058, [1 59.8 529]);  % Define 2nd Order system
rlocus(SecondOrder)  % Root Locus of 2nd Order
grid on              % Enables grid
axis([-50 0 -1 1])   % Set axis limits
title('Root Locus of 1st and 2nd Order tf','FontSize',14) % Create title
end
% ----------------------------------------------------------------------%