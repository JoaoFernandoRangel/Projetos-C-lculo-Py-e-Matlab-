clear all
close all
clc

States = {[0,0,0] [1,0,0] [1,0,90] [1,1,90] [1,1,180] [0,1,180] [0,1,270] [0,0,270]};
%Conversor de unidade
para_rad = (pi)/180;
para_grau = 1/para_rad;
erro_grau = 1;
erro_rad = erro_grau*para_rad;
erro_traj = 0.2;
% Plant dynamics
s = tf('s');
FT = 400/(s+20);  % Transfer function from input in Volts to output in Rad/s

% Desired step response
tamanho_degrau = 10;
degrau = tamanho_degrau/s;

% Vehicle parameters
Raio_roda_direita = 0.065;
Raio_roda_esquerda = 0.065;
Eixo = 0.2;
Raios_media = (Raio_roda_esquerda + Raio_roda_direita)/2;
% Feedback control (PID controller)
Kp = 1;
Ki = 0;
Kd = 0;
PID_controller = Kp + Ki/s + Kd*s;

% Feedback control (PID controller curva)
Kp_c = 0.015; %não alterar.
Ki_c = 0;
Kd_c = 0;
PID_controller_curva = Kp_c + Ki_c/s + Kd_c*s;

VelR = step(tamanho_degrau * feedback(FT * PID_controller, 1));  % Right wheel velocity (Rad/s)
VelL = step(tamanho_degrau * feedback(FT * PID_controller, 1));  % Left wheel velocity (Rad/s)
% Simulation parameters
dt = 0.02;           % time step (in seconds)
tfinal = size(VelR)*dt;% simulation time (in seconds)
t = 0:dt:tfinal;     % time vector
tempo_geral = 0:dt:3.205*tfinal;
% State variables initialization
X0 = zeros(size(t));
Y0 = zeros(size(t));
Theta0 = zeros(size(t));
% Simulation loop
for i = 2:length(VelR)
    Theta0(i) = (Raios_media/(2*Eixo))*(VelR(i) - VelL(i))*dt + Theta0(i-1);
    X0(i) = X0(i-1) + (Raios_media*(VelR(i) + VelL(i))*cos(Theta0(i)))*dt;
    Y0(i) = Y0(i-1) + (Raios_media*(VelR(i) + VelL(i))*sin(Theta0(i)))*dt;
    if ((X0(i) >= States{2}(1)) && (Y0(i) >= States{2}(2)) && (Theta0(i)*para_grau >= States{2}(3)))
        break;
    end
end

%inicia a curva
%Aciona rodas em sentidos opostos
VelR = step(tamanho_degrau * feedback(FT * PID_controller_curva, 1));  % Right wheel velocity (Rad/s)
VelL = -step(tamanho_degrau * feedback(FT * PID_controller_curva, 1));  % Left wheel velocity (Rad/s)
%inicializa os novos vetores
X1 = zeros(size(X0));
Y1 = zeros(size(X0));
Theta1 = zeros(size(X0));
i=0;
for i = 2:length(X0)
    if (X0(i) == 0)
        X1(1) = X0(i-1);
        break;
    end
end
Y1(1) = 0;
Theta1(1) = 0;
i=0;
for i = 2:length(VelR)
    Theta1(i) = (Raios_media/(2*Eixo))*(VelR(i) - VelL(i))*dt + Theta1(i-1);
    X1(i) = X1(i-1) + (Raios_media*(VelR(i) + VelL(i))*cos(Theta1(i)))*dt;
    Y1(i) = Y1(i-1) + (Raios_media*(VelR(i) + VelL(i))*sin(Theta1(i)))*dt;
    if ((X1(i) >= States{3}(1)) && (Y1(i) >= States{3}(2)) && (Theta1(i)*para_grau >= States{3}(3)))
        break;
    end
end
%finaliza curva

%inicia subida
VelR = step(tamanho_degrau * feedback(FT * PID_controller, 1));  % Right wheel velocity (Rad/s)
VelL = step(tamanho_degrau * feedback(FT * PID_controller, 1));  % Left wheel velocity (Rad/s)
% State variables initialization
X2 = zeros(size(t));
Y2 = zeros(size(t));
Theta2 = zeros(size(t));
i=0;
for i = 2:length(X1)
    if (X1(i) >= 0)
        X2(1) = X1(i-1);
        break;
    end
end
i=0;
for i = 2:length(Theta1)
    if (Theta1(i) >= States{3}(3)*para_rad)
        Theta2(1) = Theta1(i-1);
        break;
    end
end
% Simulation loop
i=0;
for i = 2:length(VelR)
    Theta2(i) = (Raios_media/(2*Eixo))*(VelR(i) - VelL(i))*dt + Theta2(i-1);
    X2(i) = X2(i-1) + (Raios_media*(VelR(i) + VelL(i))*cos(Theta2(i)))*dt;
    Y2(i) = Y2(i-1) + (Raios_media*(VelR(i) + VelL(i))*sin(Theta2(i)))*dt;
    if ((X2(i) >= States{4}(1)) && (Y2(i) >= States{4}(2)) && ((Theta2(i)*para_grau)+erro_grau) >= (States{4}(3)))
        break;
    end
end
%finaliza subida

%inicializa curva para esquerda
VelR = step(tamanho_degrau * feedback(FT * PID_controller_curva, 1));  % Right wheel velocity (Rad/s)
VelL = -step(tamanho_degrau * feedback(FT * PID_controller_curva, 1));  % Left wheel velocity (Rad/s)
X3 = zeros(size(Theta2));
Y3 = zeros(size(Theta2));
Theta3 = zeros(size(Theta2));
i=0;
for i = 2:length(X2)
    if (X2(i) >= States{4}(1))
        X3(1) = X2(i-1);
        break;
    end
end
i=0;
for i = 2:length(Y2)
    if (Y2(i) >= States{4}(2))
        Y3(1) = Y2(i-1);
        break;
    end
end
i=0;
for i = 2:length(Theta2)
    if (Theta2(i)+erro_rad >= States{4}(3)*para_rad)
        Theta3(1) = Theta2(i-1);
        break;
    end
end

for i = 2:length(VelR)
    Theta3(i) = (Raios_media/(2*Eixo))*(VelR(i) - VelL(i))*dt + Theta3(i-1);
    X3(i) = X3(i-1) + (Raios_media*(VelR(i) + VelL(i))*cos(Theta3(i)))*dt;
    Y3(i) = Y3(i-1) + (Raios_media*(VelR(i) + VelL(i))*sin(Theta3(i)))*dt;
    if ((X3(i) >= States{5}(1)) && (Y3(i)+erro_traj >= States{5}(2)) && ((Theta3(i)*para_grau) >= States{5}(3)))
        break;
    end
end
% andar para esquerda
VelR = step(tamanho_degrau * feedback(FT * PID_controller, 1));  % Right wheel velocity (Rad/s)
VelL = step(tamanho_degrau * feedback(FT * PID_controller, 1));  % Left wheel velocity (Rad/s)
X4 = zeros(size(Theta3));
Y4 = zeros(size(Theta3));
Theta4 = zeros(size(Theta3));
for i = 2:length(X3)
    if (X3(i) >= States{5}(1))
        X4(1) = X3(i-1);
        break;
    end
end
for i = 2:length(Y3)
    if (Y3(i)+erro_traj >= States{5}(2))
        Y4(1) = Y3(i-1);
        break;
    end
end
for i = 2:length(Theta3)
    if (Theta3(i)*para_grau >= States{5}(3))
        Theta4(1) = Theta3(i-1);
        break;
    end
end
for i = 2:length(VelR)
    Theta4(i) = (Raios_media/(2*Eixo))*(VelR(i) - VelL(i))*dt + Theta4(i-1);
    X4(i) = X4(i-1) + (Raios_media*(VelR(i) + VelL(i))*cos(Theta4(i)))*dt;
    Y4(i) = Y4(i-1) + (Raios_media*(VelR(i) + VelL(i))*sin(Theta4(i)))*dt;
    if ((X4(i) <= States{6}(1)) && (Y4(i)+erro_traj >= States{6}(2)) && ((Theta4(i)*para_grau)+erro_grau >= States{6}(3)))
        break;
        
    end
end
%inicializa curva para esquerda
VelR = step(tamanho_degrau * feedback(FT * PID_controller_curva, 1));  % Right wheel velocity (Rad/s)
VelL = -step(tamanho_degrau * feedback(FT * PID_controller_curva, 1));  % Left wheel velocity (Rad/s)
X5 = zeros(size(Theta4));
Y5 = zeros(size(Theta4));
Theta5 = zeros(size(Theta4));
i=0;
for i = 2:length(X4)
    if (X4(i) <= States{6}(1))
        X5(1) = X4(i-1);
        break;
    end
end
i=0;
for i = 2:length(Y4)
    if (Y4(i) >= States{6}(2))
        Y5(1) = Y4(i-1);
        break;
    end
end
i=0;
for i = 2:length(Theta4)
    if (Theta4(i)+erro_rad >= States{6}(3)*para_rad)
        Theta5(1) = Theta4(i-1);
        break;
    end
end

for i = 2:length(VelR)
    Theta5(i) = (Raios_media/(2*Eixo))*(VelR(i) - VelL(i))*dt + Theta5(i-1);
    X5(i) = X5(i-1) + (Raios_media*(VelR(i) + VelL(i))*cos(Theta5(i)))*dt;
    Y5(i) = Y5(i-1) + (Raios_media*(VelR(i) + VelL(i))*sin(Theta5(i)))*dt;
    if ((X5(i) >= States{7}(1)) && (Y5(i)+erro_traj >= States{7}(2)) && ((Theta5(i)*para_grau) >= States{7}(3)))
        break;
    end
end

%Reto para baixo
VelR = step(tamanho_degrau * feedback(FT * PID_controller, 1));  % Right wheel velocity (Rad/s)
VelL = step(tamanho_degrau * feedback(FT * PID_controller, 1));  % Left wheel velocity (Rad/s)
X6 = zeros(size(Theta5));
Y6 = zeros(size(Theta5));
Theta6 = zeros(size(Theta5));
for i = 2:length(X5)
    if (X5(i) >= States{7}(1))
        X6(1) = X5(i-1);
        break;
    end
end
for i = 2:length(Y5)
    if (Y5(i)+erro_traj >= States{7}(2))
        Y6(1) = Y5(i-1);
        break;
    end
end
for i = 2:length(Theta5)
    if (Theta5(i)*para_grau >= States{7}(3))
        Theta6(1) = Theta5(i-1);
        break;
    end
end
for i = 2:length(VelR)
    Theta6(i) = (Raios_media/(2*Eixo))*(VelR(i) - VelL(i))*dt + Theta6(i-1);
    X6(i) = X6(i-1) + (Raios_media*(VelR(i) + VelL(i))*cos(Theta6(i)))*dt;
    Y6(i) = Y6(i-1) + (Raios_media*(VelR(i) + VelL(i))*sin(Theta6(i)))*dt;
    if ((X6(i)-erro_traj <= States{8}(1)) && (Y6(i) <= States{8}(2)) && ((Theta6(i)*para_grau)+erro_grau >= States{8}(3)))
        break;        
    end
end
%Limpando os dados restantes
inz = X0 ~= 0;
X0 = X0(inz);
Y0 = Y0(inz);
Theta0 = Theta0(inz);
%Theta 1 importante
inz = Theta1 ~=0;
Theta1 = Theta1(inz);
X1 = X1(inz);
Y1 = Y1(inz);
%Y2 é importante
inz = Y2 ~=0;
Theta2 = Theta2(inz);
X2= X2(inz);
Y2 = Y2(inz);
% 3º conjunto de variáveis
inz = Theta3 ~= 0;
Theta3 = Theta3(inz);
X3 = X3(inz);
Y3 = Y3(inz);
% 4º conjunto de variáveis
inz = X4 ~= 0;
Theta4 = Theta4(inz);
X4 = X4(inz);
Y4 = Y4(inz);
% 5º conjunto de variáveis
inz = Theta5 ~= 0;
Theta5 = Theta5(inz);
X5 = X5(inz);
Y5 = Y5(inz);
% 6º conjunto de variáveis
inz = Y6 ~= 0;
Theta6 = Theta6(inz);
X6 = X6(inz);
Y6 = Y6(inz);
ThetaGeral = vertcat(Theta0(:), Theta1(:), Theta2(:), Theta3(:), Theta4(:), Theta5(:), Theta6(:));
%%
% Final state
close all
plot(X0, Y0, 'b');
hold on;
plot(X2, Y2, 'b');
plot(X4,Y4,'b');
plot(X6,Y6,'b');

title('Trajectory of Differential Drive Robot (Square)');
xlabel('X (meters)');
ylabel('Y (meters)');
axis equal;
axis([-0.5 1.5 -0.5 1.5]);  % define os limites dos eixos X e Y
grid on;

