

function [X]=modrlc2(t_etapa, xant, accion)
R=5600;   %resistencia
L=10e-6;  %bobina
C=100e-9; %capacitor
A= [-R/L -1/L; 1/C 0]; B=[1/L; 0]; 
h=4.5e-10;
u=accion;  %tension de entrada
x=xant;
for ii=1:t_etapa/h
xp=A*x+B*u;
x=x+xp*h;
end
X=x;
