% Ondas polarizadas
moduloEX = 5;
moduloEY = 3;
beta = 2;
frequencia = 1;
omega = 2*pi*frequencia;
t = linspace(0, 10, 100);
z = linspace(0, 10, 100);
[w, y, z] = meshgrid(z, z, z);

% Campo em x
EX = moduloEX .* cos(omega.*t - beta.*z);

% Campo em y
EY = moduloEY .* cos(omega.*t - beta.*z);

% Plot 3D wave
figure
quiver3(w, y, z, EX, EY, zeros(size(EX)), 1, 'LineWidth', 2, 'Color', 'r');
xlabel('w');
ylabel('y');
zlabel('z');
title('Ondas polarizadas em 3D');
