
%funcion ( a1,a2 ,a3 ) an entrada a la funcion
function [X]=modrlc(t_etapa, xant, accion) % xant: estado inicial
R=4700;   %resistencia                    % tiempo final: t_etapa final
L=10e-6;  %bobina
C=100e-9; %capacitor
A= [-R/L -1/L; 1/C 0]; B=[1/L; 0]; 
h=4.5e-10;  %h paso de integracion (se calcual euler)
u=accion;  %tension de entrada
x=xant;
for ii=1:t_etapa/h
xp=A*x+B*u;
x=x+xp*h;
end
X=x;  %return


