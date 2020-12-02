%-----------------------------------------------------------------------%
%                     GNU GENERAL PUBLIC LICENSE                        %
%                       Version 3, 29 June 2007                         %
%                                                                       %
%    This code shows how VF dampens out the ossillitary responce        %
%                                                                       %
%     https://github.com/Matthew-J-Read/Control-Systems-Analysis.git    %
%                  Copyright © 2020  Matthew J Read                     %
% ----------------------------------------------------------------------%
s = tf('s');
gain = 1.003;
g = 1/((0.07*s)+1);
G = 900/((s^2)+(3.9*s)+(900));

OpenLoop = (gain*g*G);

%                  902.7
%   -----------------------------------
%   0.07 s^3 + 1.273 s^2 + 66.9 s + 900

ClosedLoop = feedback((gain*g*G),1,-1);

 %                 902.7
 %  ------------------------------------
 %  0.07 s^3 + 1.273 s^2 + 66.9 s + 1803
 
Kt = 0.1*s; 
VelocityFeedback  = feedback(OpenLoop,Kt,-1);

%                  902.7
%   ------------------------------------
%   0.07 s^3 + 1.273 s^2 + 157.2 s + 900

Kt2 = 0.3*s; 
VelocityFeedback2  = feedback(OpenLoop,Kt2,-1);

 %                  902.7
 %   ------------------------------------
 %   0.07 s^3 + 1.273 s^2 + 337.7 s + 900
 
% input = 5V step
figure(1)
step(OpenLoop*5)
hold on
step(VelocityFeedback*5)
step(VelocityFeedback2*5)
grid on
% ----------------------------------------------------------------------%