function [b, yint] = Newtint2(x, y, xx)
n = length(x);
if length(y) ~= n, error('x and y must be same length');end
b = zeros(n,n);
b(:,1) = y(:);
for j = 2:n
    for i = 1:n-j+1
        b(i,j) = (b(i+1,j-1) - b(i,j-1))/(x(i+j-1) - x(i));
    end
end
for k = 1:length(xx)
    xt = 1; yint(k) = b(1,1);
    for j = 1:n-1
        xt = xt*(xx(k) - x(j));
        yint(k) = yint(k) + b(1,j+1) * xt;
    end
end
end

