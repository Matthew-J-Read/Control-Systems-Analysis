%-----------------------------------------------------------------------%
%                     GNU GENERAL PUBLIC LICENSE                        %
%                       Version 3, 29 June 2007                         %
%                                                                       %
%             This code investigates the OPTF stated below              %
%                                                                       %
%     https://github.com/Matthew-J-Read/Control-Systems-Analysis.git    %
%                  Copyright © 2020  Matthew J Read                     %
% ----------------------------------------------------------------------%

s = tf('s');
K = 50;
OLTF = 13.7/(s*(s+28.53));  % Open loop (Wn^2/(s*(s+(2*Z*Wn))))

%----------------------Closed-Loop Investigation------------------------------%
%-----------------------------------------------------------------------------%

CLTF = feedback(OLTF*K,1,-1); % Closed loop K*(Kss*Wn^2)/((s^2)+(2*Z*Wn*s)+(Wn^2))
 
%          685
%   -------------------
%   s^2 + 28.53 s + 685

Wn = sqrt(685);      % Wn^2 = 685
Kss = (Wn^2)/(Wn^2); % Kss*685 = 685
Z = 28.53/(2*Wn);    % 2*Z*Wn*s = 28.53*s

Tr = (2.5*Z+0.8)/(Wn);
Ts = 4/(Z*Wn);
Os = 100*exp((-Z*pi)/(sqrt(1-Z^2)));
Tp = pi/(Wn*sqrt(1-Z^2));

stepinfo(CLTF) % Matlab Acurate Step Performance

%----------------------Open-Loop Bode Investigation---------------------------%
%----------------------and Assessing Transient Performance--------------------%

margin(OLTF*K);
[Gm,Pm,Wpc,Wgc] = margin(OLTF*K);

Zeta = Pm/100; % Pm = 100*Zeta (Aproximation)
Omega_n = Wgc/(sqrt((-2*Zeta^2)+sqrt((4*Zeta^4)+1)));
overShoot = 100*exp((-Zeta*pi)/(sqrt(1-Zeta^2)));

G = (Kss*Omega_n^2)/((s^2)+(2*Zeta*Omega_n*s)+Omega_n^2); 

subplot(2,1,1)
step(CLTF)
grid on
hold on
step(G)
subplot(2,1,2)
bode(CLTF)
grid on
hold on
bode(G)
hold off

%------------------------------SSE Investigation------------------------------%
%-----------------------------------------------------------------------------%

f = figure(2);     
errortf = feedback(1,K*OLTF,-1); %different elements used in different places
step(errortf)      % SSE to a step input
grid on
hold on 
step((1/s)*errortf) % SSE to a Ramp input
%-----------------------------------------------------------------------------%
