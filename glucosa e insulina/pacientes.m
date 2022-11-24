figure
fplot(@(x) G(vectores1,x), [0 180])
hold on
fplot(@(x) G(vectores2,x), [0 180])
fplot(@(x) G(vectores3,x), [0 180])
hold off
title('Ajuste Pacientes','FontSize', 18)
xlabel('Tiempo en minutos','FontSize', 16)
ylabel('Glucosa (mg/100ml)','FontSize', 16)
legend('paciente 1','paciente 2', 'paciente 3');