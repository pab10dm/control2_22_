%si definimos R=1k entonces RC=0.005 y C=5e-06
%luego LC=2.933e-06 entonces L=0.5866
function [X]=modrlc3(t_etapa, xant, accion)
R=1000;   %resistencia R=1000
L=0.5866;  %bobina    L=0.5866
C=5e-6; %capacitor    C=5e-06
A= [-R/L -1/L; 1/C 0]; B=[1/L; 0]; 
h=4.5e-10;
u=accion;  %tension de entrada
x=xant;
for ii=1:t_etapa/h
xp=A*x+B*u;
x=x+xp*h;
end
X=x;

%  G(s)= 1/(LCse2+RCs+1)
%
%  sys_G_ang=1/(2.933e-06 s^2 + 0.005 s + 1)
%