

clear;close all;
% X=-[0; 0];ii=0;t_etapa=1e-9;wRef=2;tF=22e-4; 
X=-[0; 0];ii=0;t_etapa=1e-6;wRef=2;tF=4e-3;
%Constantes del PID
color_='b';
Ts=t_etapa;
u=12;
for t=0:t_etapa:tF
    if ii*t_etapa>1e-3
        u=-12;
    end
ii=ii+1;%k=ii+2;
X=modrlc2(t_etapa, X, u);
x1(ii)=X(1);%corriente en la bobina
x2(ii)=X(2);%tension en el capacitor
acc(ii)=u;
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
