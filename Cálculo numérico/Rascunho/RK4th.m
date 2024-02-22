function [x, y] = RK4th(dfdx,x0,y0, intervalo, h)
%ODE Summary of this function goes here

x(1) = x0;
y(1) = y0;
n = (intervalo(1,2)-intervalo(1,1))/h;
for i=1:n
    k1 = h*dfdx(x(i),y(i));
    k2 = h*dfdx(x(i) +0.5*h, y(i) +0.5*k1);
    k3 = h*dfdx(x(i) +0.5*h, y(i) +0.5*k2);
    k4 = h*dfdx(x(i) +0.5*h, y(i) +0.5*k3);
    x(i+1) = x(i) + h;
    y(i+1) = y(i) + (1/6)*(k1+2*k2+2*k3+k4);
end


end

