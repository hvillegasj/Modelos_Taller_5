%Script para hacer los cálculos necesarios para el análisis de
%sensibilidad.

T=10000;
%Vector con los párametros previamente calculados con el valor de A al
%final
V=[20.9255 1.2831e-5 70.9158 4.7498 7.4e-4];
%Declaración de las funciones a analizar
syms A(s,d,a,b,h)
syms F(s,d,a,b,h)
A(s,d,a,b,h)=(T*d*(s+b)-h*s*a)/(d*(s+a+b));
F(s,d,a,b,h)=(a*h*s)/((s+b)*d);

A_0=A(V(1),V(2),V(3),V(4),V(5));
F_0=F(V(1),V(2),V(3),V(4),V(5));

%Derivación de las funciones con respecto a los distintos parámetros
As=diff(A,s);
Ad=diff(A,d);
Aa=diff(A,a);
Ab=diff(A,b);
Ah=diff(A,h);

Fs=diff(F,s);
Fd=diff(F,d);
Fa=diff(F,a);
Fb=diff(F,b);
Fh=diff(F,h);

%Cálculo de las sensibilidades
Ss1=double((V(1)/A_0)*As(V(1),V(2),V(3),V(4),V(5)));
Sd1=double((V(2)/A_0)*Ad(V(1),V(2),V(3),V(4),V(5)));
Sa1=double((V(3)/A_0)*Aa(V(1),V(2),V(3),V(4),V(5)));
Sb1=double((V(4)/A_0)*Ab(V(1),V(2),V(3),V(4),V(5)));
Sh1=double((V(5)/A_0)*Ah(V(1),V(2),V(3),V(4),V(5)));

Ss2=double((V(1)/F_0)*Fs(V(1),V(2),V(3),V(4),V(5)));
Sd2=double((V(2)/F_0)*Fd(V(1),V(2),V(3),V(4),V(5)));
Sa2=double((V(3)/F_0)*Fa(V(1),V(2),V(3),V(4),V(5)));
Sb2=double((V(4)/F_0)*Fb(V(1),V(2),V(3),V(4),V(5)));
Sh2=double((V(5)/F_0)*Fh(V(1),V(2),V(3),V(4),V(5)));

%Matriz para ver las sensibilidades de manera más
S=[Ss1 Ss2; Sd1 Sd2; Sa1 Sa2; Sb1 Sb2; Sh1 Sh2]