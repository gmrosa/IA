# Autores: Guilherme Murilo da Rosa, Guilherme Sautner, Jean Pereira
clear all;clc; close all;

% load('Dados/data.mat');
% dataMat = data;
load('data_preg.mat');
data_pregMat = data;

x = data_pregMat(:,1);
y = data_pregMat(:,2);

figure (1);
hold on;
scatter (x, y);
# 1 vermelho
n = 1;
b = polyfit(x, y, n);
b0 = b(2);
b1 = b(1);
yt = (b0+(b1*x));
plot(x, yt, "r");
# EQM= (sum(residuo)) / size(y,1)
# residuo = (y - ?)
rEQM = (sum((y.-yt).^2) / size(y,1));
disp('EQP vermelho');
disp(rEQM);
# 2 verde
n = 2;
b = polyfit(x, y, n);
b0 = b(3);
b1 = b(2);
b2 = b(1);
yt = (b0+(b1*x)+(b2*x.^2));
plot(x, yt, "g");
# EQM= (sum(residuo)) / size(y,1)
# residuo = (y - ?)
gEQM = (sum((y.-yt).^2) / size(y,1));
disp('EQP verde');
disp(gEQM);
# 3 preto
n = 3;
b = polyfit(x, y, n);
b0 = b(4);
b1 = b(3);
b2 = b(2);
b3 = b(1);
yt = (b0+(b1*x)+(b2*x.^2)+(b3*x.^3));
plot(x, yt, "k");
# EQM= (sum(residuo)) / size(y,1)
# residuo = (y - ?)
kEQM = (sum((y.-yt).^2) / size(y,1));
disp('EQP preto');
disp(kEQM);
# 8 magenta
n = 8;
b = polyfit(x, y, n);
b0 = b(9);
b1 = b(8);
b2 = b(7);
b3 = b(6);
b4 = b(5);
b5 = b(4);
b6 = b(3);
b7 = b(2);
b8 = b(1);
yt = (b0+(b1*x)+(b2*x.^2)+(b3*x.^3)+(b4*x.^4)+(b5*x.^5)+(b6*x.^6)+(b7*x.^7)+(b8*x.^8));
plot(x, yt, "m");
title('n=8 é o mais preciso (EQM)');
# EQM= (sum(residuo)) / size(y,1)
# residuo = (y - ?)
yEQM = (sum((y.-yt).^2) / size(y,1));
disp('EQP magenta');
disp(yEQM);
hold off;

# 10% para teste
tamanhoTeste = round(length(x)*0.1);
ind = randperm(length(x));
indTeste = ind(1:tamanhoTeste);
indTreinamento = ind(tamanhoTeste+1:end);
# dados para teste
dTx = x(indTeste);
dTy = y(indTeste);
# os outros 90% é para treinamento
dTRx = x(indTreinamento);
dTRy = y(indTreinamento);

#  dados de treinamento
figure (2);
hold on;
scatter (dTRx, dTRy);

n = 1;
b = polyfit(dTRx, dTRy, n);
b0 = b(2);
b1 = b(1);
yt = (b0+(b1*dTRx));
plot(dTRx, yt, "r");
rEQM = (sum((dTRy.-yt).^2) / size(dTRy,1));
disp('EQP dados de treinamento n=1');
disp(rEQM);

n = 2;
b = polyfit(dTRx, dTRy, n);
b0 = b(3);
b1 = b(2);
b2 = b(1);
yt = (b0+(b1*dTRx)+(b2*dTRx.^2));
plot(dTRx, yt, "r");
rEQM = (sum((dTRy.-yt).^2) / size(dTRy,1));
disp('EQP dados de treinamento n=2');
disp(rEQM);

n = 3;
b = polyfit(dTRx, dTRy, n);
b0 = b(4);
b1 = b(3);
b2 = b(2);
b3 = b(1);
yt = (b0+(b1*dTRx)+(b2*dTRx.^2)+(b3*dTRx.^3));
plot(dTRx, yt, "r");
rEQM = (sum((dTRy.-yt).^2) / size(dTRy,1));
disp('EQP dados de treinamento n=3');
disp(rEQM);

n = 8;
b = polyfit(dTRx, dTRy, n);
b0 = b(9);
b1 = b(8);
b2 = b(7);
b3 = b(6);
b4 = b(5);
b5 = b(4);
b6 = b(3);
b7 = b(2);
b8 = b(1);
yt = (b0+(b1*dTRx)+(b2*dTRx.^2)+(b3*dTRx.^3)+(b4*dTRx.^4)+(b5*dTRx.^5)+(b6*dTRx.^6)+(b7*dTRx.^7)+(b8*dTRx.^8));
plot(dTRx, yt, "r");
rEQM = (sum((dTRy.-yt).^2) / size(dTRy,1));
disp('EQP dados de treinamento n=8');
disp(rEQM);

hold off;

#  dados de teste
figure (3);
hold on;
scatter (dTx, dTy);

n = 1;
b = polyfit(dTx, dTy, n);
b0 = b(2);
b1 = b(1);
yt = (b0+(b1*dTx));
plot(dTx, yt, "k");
rEQM = (sum((dTy.-yt).^2) / size(dTy,1));
disp('EQP dados de teste n=1');
disp(rEQM);

n = 2;
b = polyfit(dTx, dTy, n);
b0 = b(3);
b1 = b(2);
b2 = b(1);
yt = (b0+(b1*dTx)+(b2*dTx.^2));
plot(dTx, yt, "k");
rEQM = (sum((dTy.-yt).^2) / size(dTy,1));
disp('EQP dados de teste n=2');
disp(rEQM);

n = 3;
b = polyfit(dTx, dTy, n);
b0 = b(4);
b1 = b(3);
b2 = b(2);
b3 = b(1);
yt = (b0+(b1*dTx)+(b2*dTx.^2)+(b3*dTx.^3));
plot(dTx, yt, "k");
rEQM = (sum((dTy.-yt).^2) / size(dTy,1));
disp('EQP dados de teste n=3');
disp(rEQM);

n = 8;
b = polyfit(dTx, dTy, n);
b0 = b(9);
b1 = b(8);
b2 = b(7);
b3 = b(6);
b4 = b(5);
b5 = b(4);
b6 = b(3);
b7 = b(2);
b8 = b(1);
yt = (b0+(b1*dTx)+(b2*dTx.^2)+(b3*dTx.^3)+(b4*dTx.^4)+(b5*dTx.^5)+(b6*dTx.^6)+(b7*dTx.^7)+(b8*dTx.^8));
plot(dTx, yt, "k");
rEQM = (sum((dTy.-yt).^2) / size(dTy,1));
disp('EQP dados de teste n=8');
disp(rEQM);

hold off;