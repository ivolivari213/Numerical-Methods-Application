
Tt = [1950 1960 1970 1980 1990 2000];
Tp = [2555 3040 3708 4454 5276 6079];

kgm = 0.026;
pmax = 12000;

dydt = @(p)(kgm * (1 - (p/pmax)) * p);

h = 10;
y0 = 2555;
tspan = [1950 2000];

[t, y] = Eulode(dydt, tspan, y0, h)
figure(1)
plot(Tt, Tp, 'm^--', t, y, 'r*--')
xlabel('Years')
ylabel('Population')
legend('True Values', 'Euler Approximation')
title('Problem 5: Euler')
figure(2)
ea=[1.24 0.95 2.66 4.18 4.32];
Tt1 = [1960 1970 1980 1990 2000];

plot(Tt1,ea,'-*')
title('Euler % error')
xlabel('Years')
ylabel('%Error')