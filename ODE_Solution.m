%Parámetros del sistema de ecuaciones
Maximization;
s = S(1);
d = S(2);
a = S(3);
b = S(4);
r=200; %Parámetro a variar antes de correr el programa
P_0=50;

%Declaro el sistema de ecuaciones mediante una función anónima
%x(1):=F, x(2):=A, x(3):=P

dx_dt=@(t,x)[s*T-s*x(1)-s*x(2)-d*x(1)*x(3);d*x(1)*x(3)+b*T-b*x(1)-(b+a)*x(2);r*x(2)*(1-(h)/(x(2))*x(3))];

%Aplico ode45 para solucionar el sistema
[t,x]=ode45(dx_dt,[0 100],[T h*P_0 P_0]);
sz=size(t);

plot(t,3333*ones(sz),t,x(:,1),t,x(:,2))
hold on;
plot(t,x(:,1))
hold on;
plot(t,x(:,2))
legend({'C','F','A'})
figure();
plot(t,x(:,3))
