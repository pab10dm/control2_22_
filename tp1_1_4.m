% caso 1 punto 4 rlc

clear all; clc;
StepAmplitude=12;

[X]=xlsread('Curvas_Medidas_RLC');

t0=X(:,1);              %tomo los valores del tiempo que estan en la cloumna 1
y=X(:,2);                %corriente en la bobina
t_off=0.01;              %tiempo de offset (demora)
t_t1=4e-3;               %tiempo de inicio de la curva
t_inic=t_off+t_t1;       %tiempo de offset mas tiempo inicial


[val lugar] =min(abs(t_inic-t0)); y_t1=y(lugar);
ii=0; % for t_inic=10:15
ii=ii+1;
t_2t1=2*t_t1;
t_inic=t_off+t_2t1;

[val lugar] =min(abs(t_inic-t0));
y_2t1=y(lugar);
t_3t1=3*t_t1;
t_inic=t_off+t_3t1;

[val lugar] =min(abs(t_inic-t0));
y_3t1=y(lugar);
[val,lugar] =min(abs(0.049-t0));

K=y(lugar)/12;   %se divide en la amplitud q seria 12
k1=(1/StepAmplitude)*y_t1/K-1;                  %Afecto el valor del Escalon
k2=(1/StepAmplitude)*y_2t1/K-1;
k3=(1/StepAmplitude)*y_3t1/K-1;
be=4*k1^3*k3-3*k1^2*k2^2-4*k2^3+k3^2+6*k1*k2*k3;
alfa1=(k1*k2+k3-sqrt(be))/(2*(k1^2+k2));
alfa2=(k1*k2+k3+sqrt(be))/(2*(k1^2+k2));
beta=(k1+alfa2)/(alfa1-alfa2);

T1_ang=-t_t1/log(alfa1);
T2_ang=-t_t1/log(alfa2);
T3_ang=beta*(T1_ang-T2_ang)+T1_ang;
T1(ii)=T1_ang;
T2(ii)=T2_ang;
T3(ii)=T3_ang;
T3_ang=sum(T3/length(T3));
T2_ang=sum(T2/length(T2));
T1_ang=sum(T1/length(T1));

sys_G_ang=tf(K*[T3_ang 1],conv([T1_ang 1],[T2_ang 1]))
[yo,to]=step(12*sys_G_ang,0.05-t_off);
plot(t0,y,'r'), hold on 
plot(t_t1+0.01,y_t1,'o')
plot(t_2t1+0.01,y_2t1,'o')
plot(t_3t1+0.01,y_3t1,'o'),hold on  
plot(to+t_off,yo), axis([0 0.1 -0.2 0.2])


%break
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
Xx=[0; 0]; iii=0; t_etapa=1e-6;  tF=85e-03;
%Constantes del PID
%color_='b';
iii=0;
jj=0;
u=12; %f=1;
for t=0.01:t_etapa:tF %va de o a tF y t_etapa es la vble (1e.-6 ) q toma valores cada ese tiempo
    if iii*t_etapa>40e-3
        u=u*(-1);  %para cambiar la tension
        iii=0;
    end
iii=iii+1;%k=ii+2;
jj=jj+1;
Xx=modrlc3(t_etapa, Xx, u);
x1(jj)=Xx(1);%corriente en la bobina
x2(jj)=Xx(2);%tension en el capacitor
acc(jj)=u;
end

% % % %
figure
plot(t0,y,'r')
tr=0.01:t_etapa:tF;
% figure
hold on
plot(tr,x1,'g');
title('corriente');
%subplot(3,1,3);hold on;
%plot(t,acc,color_);title('tension');
xlabel('Tiempo [Seg.]');
