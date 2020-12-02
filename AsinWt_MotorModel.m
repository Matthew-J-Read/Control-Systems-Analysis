%--------------------------%
function AsinWt()  
s = tf('s');
motor = 13.7/(s^2+28.53*s);

A = 1;
W = 3;
Q = 90;
t = (0 : 0.02 : 10);
v = A*sin((W*t)+Q);
plot(t,v)
grid on
hold on
y = lsim(motor , v , t);
plot(t,y)
hold off



end
%-------------------------%

