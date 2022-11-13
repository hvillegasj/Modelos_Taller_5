%Script con la restricción no lineal
function [c,ceq] = Constraint(x,T,h)
  c=[]
  ceq=(x(1)*x(3))/((x(1)+x(4))*x(2))-(T)/(3*h);
end