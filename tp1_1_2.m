% caso 1 punto 1 y 2

clear;close all;
% X=-[x1; x2] corrinte y tensin en el capacitor
%;ii=0;
% t_etapa=1e-9; tiempo en q se divide el tiempo etapa tF
%wRef=2;
%tF=22e-4; tiempo total
X=[0; 0]; ii=0; t_etapa=1e-6;  tF=4e-3;
%Constantes del PID
color_='r';
ii=0;
jj=0;
u=12; f=1;
for t=0:t_etapa:tF %va de o a tF y t_etapa es la vble (1e.-6 ) q toma valores cada ese tiempo
    if ii*t_etapa>1e-3
        u=u*(-1);  %para cambiar la tension
        ii=0;
    end
ii=ii+1;%k=ii+2;
jj=jj+1;
X=modrlc(t_etapa, X, u);
x1(jj)=X(1);%corriente en la bobina
x2(jj)=X(2);%tension en el capacitor
acc(jj)=u;
end
t=0:t_etapa:tF;
subplot(3,1,1);hold on;
plot(t,x1,color_);title('corriente');
subplot(3,1,3);hold on;
plot(t,acc,color_);title('tension');
xlabel('Tiempo [Seg.]');
subplot(3,1,2);hold on;
plot(t,x2,color_);title('Tension del capacitor');
 hold on
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%repetido para otro modelo (otras constantes rlc)
X=[0; 0]; ii=0; t_etapa=1e-6;  tF=4e-3;
%Constantes del PID
color_='b';
ii=0;
jj=0;
u=12; f=1;
for t=0:t_etapa:tF %va de o a tF y t_etapa es la vble (1e.-6 ) q toma valores cada ese tiempo
    if ii*t_etapa>1e-3
        u=u*(-1);  %para cambiar la tension
        ii=0;
    end
ii=ii+1;%k=ii+2;
jj=jj+1;
X=modrlc2(t_etapa, X, u);
x1(jj)=X(1);%corriente en la bobina
x2(jj)=X(2);%tension en el capacitor
acc(jj)=u;
end
t=0:t_etapa:tF;
subplot(3,1,1);hold on;
plot(t,x1,color_);title('corriente');
subplot(3,1,3);hold on;
plot(t,acc,color_);title('tension');
xlabel('Tiempo [Seg.]');
subplot(3,1,2);hold on;
plot(t,x2,color_);title('Tension del capacitor');
 hold on
 
 
 
 