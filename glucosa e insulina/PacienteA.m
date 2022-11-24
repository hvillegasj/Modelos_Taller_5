Datos=[ 0   67.8000;
        30  129.5789;
        60  105.8170;
        90   50.2596;
        120  49.3466;
        150  71.1210;
        180  72.7567];

t=Datos(:,1);
g_t=Datos(:,2);

%model
G = @(G0,A,alpha,beta,delta,t) G0 + A * exp (alpha*t) * cos(beta(t-delta));
%Observations
%G_t = infsup(g_t);
%Estimate parameters
f = @(G0,A,alpha,beta,delta,t) G (G0,A,alpha,beta,delta,t);
%plot
plot(t,g_t,'ro');

%fitting
fit2 = fit(t,g_t,'poly4');
plot(fit2,t,g_t);