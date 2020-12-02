 %-----------------------------------------------------------------------%
 %                     GNU GENERAL PUBLIC LICENSE                        %
 %                       Version 3, 29 June 2007                         %
 %                                                                       %
 %     This code estimates diferent models for the trd input data        %
 %                                                                       %
 %     https://github.com/Matthew-J-Read/Control-Systems-Analysis.git    %
 %                  Copyright © 2020  Matthew J Read                     %
 % ----------------------------------------------------------------------%

load set7x_2.trd           % Load Servocad7 file (amplitude data)
data = set7x_2(2:1:202);   % Sampling time is first data point (ignore it)
time = (0:0.02:4).';       % Create time data in array columns 

indata = zeros(201,1)+1;             % Create 5 volt step input data 
Ts = set7x_2(1);                     % Sampling time is first data point
ServoSet = iddata(data,indata,Ts);   % Create data object Input/Output 

Options = tfestOptions;            
Options.Display = 'on';            
Options.WeightingFilter = []; 

%       System models with different plole and zero amounts
% ----------------------------------------------------------------------%
model1 = tfest(ServoSet,1,0,Options);  % Estimate a Tf model1 
model2 = tfest(ServoSet,2,0,Options);  % Estimate a Tf model2 
model3 = tfest(ServoSet,3,0,Options);  % Estimate a Tf model3     
model4 = tfest(ServoSet,4,0,Options);  % Estimate a Tf model4
model5 = tfest(ServoSet,5,0,Options);  % Estimate a Tf model5 
model6 = tfest(ServoSet,6,0,Options);  % Estimate a Tf model6 
model7 = tfest(ServoSet,1,1,Options);  % Estimate a Tf model7 
model8 = tfest(ServoSet,2,1,Options);  % Estimate a Tf model8 
model9 = tfest(ServoSet,3,1,Options);  % Estimate a Tf model9     
model10 = tfest(ServoSet,4,1,Options); % Estimate a Tf model10
model11 = tfest(ServoSet,5,1,Options); % Estimate a Tf model11
model12 = tfest(ServoSet,6,1,Options); % Estimate a Tf model12 
model13 = tfest(ServoSet,3,2,Options); % Estimate a Tf model13    
model14 = tfest(ServoSet,4,2,Options); % Estimate a Tf model14
model15 = tfest(ServoSet,5,2,Options); % Estimate a Tf model15
model16 = tfest(ServoSet,6,2,Options); % Estimate a Tf model16
% ----------------------------------------------------------------------%