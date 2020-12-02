%-----------------------------------------------------------------------%
%                     GNU GENERAL PUBLIC LICENSE                        %
%                       Version 3, 29 June 2007                         %
%                                                                       %
%         This script shows the affect of adding a pre filter           %
%                                                                       %
%     https://github.com/Matthew-J-Read/Control-Systems-Analysis.git    %
%                  Copyright © 2020  Matthew J Read                     %
% ----------------------------------------------------------------------%
s = tf('s');
K = 2.43;
g = (1*20)/(s*(s+1)*(s+10));
G = (g*((14*(s+2))/(s+28)));
gcl = feedback(g,1,-1);
Gcl = feedback((G*K),1,-1);

step(gcl)
hold on
step(Gcl)
grid on
xlim([0 20])
hold on

pf = 2/(s+2);
step(pf*Gcl)
% ----------------------------------------------------------------------%