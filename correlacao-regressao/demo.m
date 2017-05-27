clear all;clc; close all;

x1 = [10;8;13;9;11;14;6;4;12;7;5];
y1 = [8.04;6.95;7.58;8.81;8.33;9.96;7.24;4.26;10.84;4.82;5.68];

x2 = [10;8;13;9;11;14;6;4;12;7;5];
y2 = [9.14;8.14;8.47;8.77;9.26;8.10;6.13;3.10;9.13;7.26;4.74];

x3 = [8;8;8;8;8;8;8;8;8;8;19];
y3 = [6.58;5.76;7.71;8.84;8.47;7.04;5.25;5.56;7.91;6.89;12.50];

figure(1);
x = x1;
y = y1;
hold on;
scatter (x, y);
r = correlacao(x, y)
[b0 b1 yt] = regressao(x, y)
title(strcat(" r = ", num2str(r), ", b0 = ", num2str(b0), ", b1 = ", num2str(b1) ))
plot(x, yt);
hold off;


figure(2);
x = x2;
y = y2;
hold on;
scatter (x, y);
r = correlacao(x, y)
[b0 b1 yt] = regressao(x, y)
title(strcat(" r = ", num2str(r), ", b0 = ", num2str(b0), ", b1 = ", num2str(b1) ))
plot(x, yt);
hold off;


figure(3);
x = x3;
y = y3;
hold on;
scatter (x, y);
r = correlacao(x, y)
[b0 b1 yt] = regressao(x, y)
title(strcat("(Conjunto de Dados n�o Apropriado para Regress�o)\n", " r = ", num2str(r), ", b0 = ", num2str(b0), ", b1 = ", num2str(b1) ))
plot(x, yt);
hold off;