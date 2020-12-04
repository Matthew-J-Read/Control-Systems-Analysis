              %-----------------------------------------------------------------------%
              %                     GNU GENERAL PUBLIC LICENSE                        %  
              %                       Version 3, 29 June 2007                         %
              %                                                                       %
              %           This code shows R-L Closed loop pole migration              %
              %           This Code only works for this TF Please see a more          %
              %           gentilised version on my GitHub                             %
              %                                                                       %
              %     https://github.com/Matthew-J-Read/Control-Systems-Analysis.git    %
              %                  Copyright ¬© 2020  Matthew J Read                    %
              % ----------------------------------------------------------------------%
 
%-----------------------------------------------------------------------------------------------------
%--------------------THIS MAY TAKE A MIN OR 2 TO RUN AS ITS PLOTTING THE R-L GAINS--------------------
%-----------------------------------------------------------------------------------------------------
clear
s = tf('s');                    % Create Continuous time tf
gain1 = (0:0.001:1);             % 0.001 Gain increments to 1
gain2 = (1:0.01:10);             % 0.01 Gain increments to 10
g = 1/((0.07*s)+1);             % Openloop First order tf
G = 900/((s^2)+(3.9*s)+(900));  % Openloop second order tf
Kt = 0.3;                       % Velocity feedback of 0.3
 
%                         900
%  g*G =   -----------------------------------
%          0.07 s^3 + 1.273 s^2 + 66.9 s + 900
 
hold on                            % Hold data
grid on                            % Enable grid lines
grid(gca,'minor')                  % Enable minor grid lines
ax = gca;                          % Get handle to current axes
rgb = [0.1, 0.7, 0.2];             % Set Dark green RGB
ax.GridColor = rgb;                % Dark green grid
ax.GridAlpha = 1;                  % Make grid lines less transparent
ax.MinorGridColor = ax.GridColor;  % Dark green minor grid
ax.MinorGridLineStyle = '-';       % Set minor grid lines solid 
title('MATLAB Root-Locus of servoset system (3rd order) with Kt = 0.3') % Set title
xlabel('Real axis')                % Set X label
ylabel('Imaganary axis')           % Set Y label
 
b = gain1;                               % b variable for nested loop
c = 1001;                                % c variable for nested loop
for d = 1:2                              % Loop twice
for i = 2:1:c                            % Loop 1001 times to gain ++
OL = b(i)*g*G;                           % Openloop 3rd order tf
[P1,~] = pzmap(feedback(OL,Kt*s,-1));    % 3rd order tf VF closed loop
a = P1;                                  % a = pole data
a(2:3) = [];                             % Ignore array elements 2 & 3 
plot(a,'.','color',rgb)                  % Plot CL pole migration to g = 1
a = P1;                                  % a = pole data
a(3) = [];                               % Ignore array element 3
a(1) = [];                               % Ignore array element 1
plot(a,'.','color','r')                  % Plot CL pole migration to g = 1
a = P1;                                  % a = pole data
a(1:2) = [];                             % Ignore array elements 1 & 2
a = complex(a);                          % Re-add 0i imaginary vector 
plot(a,'.','color','b')                  % Plot CL pole migration to g = 1
end
b = gain2;                               % change b variable for 2nd time around
c = 901;                                 % change c variable for 2nd time around
end
 
[P3,~] = pzmap(1.003*g*G);                        
plot(P3,'x','LineWidth',3,'color','k')   % Plot 3rd order Openloop poles
[P4,~] = pzmap(feedback...
         ((1.003*g*G),(0.3*s),-1));      % add Vf to feedback path of Kts = 0.3s
plot(P4,'+','LineWidth',3,'color','m')   % Plot 3rd order VF poles
plot(0,0,'o','LineWidth',2,'color','k')  % Plot the Zero at origin from diff block
xlim([-15 1])                            % Set X limit
ylim([-200 200])                         % Set Y limit
 
 
Num_Poles = pole(OL);                    % Make array with pole data
Num_Poles = Num_Poles.';                 % put array columns in rows
Num_Poles = size(Num_Poles);             % Find amount of poles in the system
Num_Poles(1) = [];                       % Delete first array position (not needed) 
Num_Zeros = zero(OL);                    % Make array with zero data 
Num_Zeros = Num_Zeros.';                 % put array columns in rows
Num_Zeros = size(Num_Zeros);             % Find amount of zeros in the system
Num_Zeros(1) = [];                       % Delete first array position (not needed)
Num_Zeros = Num_Zeros+1;                 % Remember to add the zero from VF block (DiFF)
 
Sigma_Poles = sum(pole(OL));             % Sum of poles
Sigma_Zeros = sum(zero(OL));             % Sum of zeros
 
asymptote_position = (Sigma_Poles-Sigma_Zeros)/(Num_Poles-Num_Zeros); % Find asymptote position 
asymptote_angle = (180/(Num_Poles-Num_Zeros));                        % Find asymptote angle (n = 0)
if asymptote_angle > 360
            asymptote_angle = asymptote_angle - 360;                  % if angle > 360 then - 360
end
 
scale = 1000000;                               % this is a scaling factor for a 90deg asymptote line 
plot([asymptote_position 0],[0 scale],'k--')   % Plot asymptote line positive 
plot([asymptote_position 0],[0 -scale],'k--')  % Plot asymptote line negative
 
%-----------------------------------------------------------------------------------------------------

