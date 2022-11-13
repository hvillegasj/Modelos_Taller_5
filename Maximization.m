%Parámetros
T=10000;
h=740;
%Función objetivo
Ar=@(x)-(T*x(2)*(x(1)+x(4))-h*x(1)*x(3))/(x(2)*(x(1)+x(4)+x(3)));
%Función restricción
cons=@(x)Constraint(x,T,h);

%Argumentos necesarios para implementar la función optimizadora
x_0=[1,1,1,1];
A=[];
b=[];
lb=[];
ub=[0,0,0,0];

S = fmincon(Ar,x_0,A,b,A,b,lb,ub,cons);
