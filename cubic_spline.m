function s = cubic_spline(xx, f)
n = length(xx); s =[];
h(1:n-1) = xx(2:n) - xx(1:n-1);
T(1:n-1) = (f(2:n) - f(1:n-1))./h(1:n-1);
R(1:n-2) = 3.*(T(2:n-1) - T(1:n-2));

U(1:n-3) = h(2:n-2); U(n-2)=0;
D(1:n-2) = 2*(h(1:n-2) + h(2:n-1));
L(1)=0; L(2:n-2) = h(2:n-2);
cc = Tridiag(L,D,U,R);
c(1)=0; c(n)=0; c(2:n-1) = cc(1:n-2);
a(1:n)=f(1:n);
d(1:n-1) = (c(2:n) -c(1:n-1)) ./(3. *h(1:n-1));
b(1:n-1) = T(1:n-1) -h(1:n-1) ./3.*(2*c(1:n-1)+c(2:n));

for i=1 : n-1
    s1 =[]; s2=[];
    fprintf('\nResulting piecewise function: \n\n');
    s1 = [sprintf('(%f)+(%f)*(x-(%f))', a(i),b(i),xx(i))]
    s2 = [sprintf('(%f)*(x-(%f)).^2+(%f)*(x-(%f)).^3',c(i),xx(i),d(i),xx(i))]
    x = xx(i): (xx(i+1) -xx(i))/10 : xx(i+1);
    y = eval(s1) + eval(s2); s = [s y];
    h1 =plot(x,y); hold on; set(h1,'LineWidth',3);
end

h2=plot(xx,f,'ro');
title('Cubic Spline');
xlabel('XX');
ylabel('f');
set(h2,'LineWidth',5,'MarkerSize',6);
end