



function [t, y] = Eulode(dydt, tspan, y0, h)

ti = tspan(1);
tf = tspan(2);
t = (ti:h:tf)';
n = length(t);

if t(n) < tf
    t(n+1) = tf;
    n = n + 1;
end
y = y0*ones(n,1);
for i = 1: n-1
        y(i+1) = y(i) + feval(dydt,  y(i))*(t(i+1)-t(i));
    a = tspan(1); b = tspan(2); h = (b-a)/n;

end
disp('    step         t                 y')
k = 1:length(t); out = [k; t';y'];
fprintf('%5d  %15.10f %15.10f\n',out)

