Datos=[ 0   67.8000;
        30  129.5789;
        60  105.8170;
        90   50.2596;
        120  49.3466;
        150  71.1210;
        180  72.7567];

t=Datos(:,1);
g_t=Datos(:,2);

G = @(c,t) c(1) + c(2) * exp (-c(3)*(t/60)) .* cos(c(4)*((t/60)-c(5)));

x0 = [70,130,1,1,1];

%optional
options = optimoptions('lsqcurvefit','Algorithm','levenberg-marquardt');
lb = [];
ub = [];

vectores1 = lsqcurvefit(G,x0,t,g_t,lb,ub,options);
%plot
aa=linspace(0,180);
figure
plot(t,g_t,'ro');
hold on
fplot(@(x) G(vectores1,x), [0 180])
grid on
hold off
title('Ajuste Paciente 1','FontSize', 18)
xlabel('Tiempo en minutos','FontSize', 16)
ylabel('Glucosa (mg/100ml)','FontSize', 16)
