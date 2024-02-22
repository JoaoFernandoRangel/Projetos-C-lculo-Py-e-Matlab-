function [teste] = compolyfit(x,y)
syms x;
n = size(x);
grau = n(1,2) - 1;
m = polyfit(x,y,grau);
polyLaGrange = 0;
for i=1:grau
    polyLaGrange = polyLaGrange + ((x^(grau-i))*m(i))  
end
polyLaGrange

end

