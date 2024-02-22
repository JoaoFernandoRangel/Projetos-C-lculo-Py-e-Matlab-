function [x,y] = EulerSimples(dfdx,x0,y0,intervalo, h)
%EULERSIMPLES Summary of this function goes here
%   Detailed explanation goes here
x(1) = x0;
y(1) = y0;
n = (intervalo(1,2)-intervalo(1,1))/h;
for i=1:n
     y(i+1) = y(i)+ h*dfdx(x(i),y(i));
     x(i+1) = x(i)+h;
end

end

