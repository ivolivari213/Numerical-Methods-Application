x = [1.6 2 2.5 3.2 4 4.5];
y = [2 8 14 15 8 2];
fx = 2.8;

	fx = [x, fx];
	fx = sort(fx);

	[b, yint] = Newtint2(x, y, fx);
	c = Lagrange_coef(x,y);
	p = lagrange_eval(fx, x, c);

    
	plot(fx, yint, 'r-*')
	xlabel('X')
	ylabel('F(x)')
    title(' Newton & Lagrange in same scale')
	hold on
	plot(fx, p, 'c--o')
    legend('Newton Interpolating Polynomial','Lagrange Interpolating Polynomial')