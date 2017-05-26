clear all;clc; close all;

% load('Dados/data.mat');
% dataMat = data;
% load('Dados/data_preg.mat');
% data_pregMat = data;

% x = data_pregMat(:,1);
% y = data_pregMat(:,2);

x = [10;8;13;9;11;14;6;4;12;7;5];
y = [8.04;6.95;7.58;8.81;8.33;9.96;7.24;4.26;10.84;4.82;5.68];

#scatter (x, y);

#correlação
r = correlacao(x, y);
#regressão
[b0 b1] = regressao(x, y);

yF = b0+b1;