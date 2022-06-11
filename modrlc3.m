%si definimos R=1k entonces RC=0.005 y C=5e-06
%luego LC=2.933e-06 entonces L=0.5866
function [X]=modrlc3(t_etapa, xant, accion)
C= 2.177e-05; %capacitor    C=5e-06
L=2.347e-06/C;  %bobina    L=0.5866
R=0.004865/C;   %resistencia R=1000
A= [-R/L -1/L; 1/C 0]; B=[1/L; 0]; 
h=4.5e-7;
u=accion;  %tension de entrada
x=xant;
for ii=1:t_etapa/h
xp=A*x+B*u;
x=x+xp*h;
end
X=x;

% la corriente
%sys_G_ang =
%             7.009e-07
%   ------------------------------
%   2.347e-06 s^2 + 0.004865 s + 1
