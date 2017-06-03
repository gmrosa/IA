close all; clc; clear;

function visualizaPontos(dados, rotulos, d1, d2)
  figure; clf; hold on
  plot(dados(rotulos == 1, d1), dados(rotulos == 1, d2), 'r.');
  plot(dados(rotulos == 2, d1), dados(rotulos == 2, d2), 'b+');
  plot(dados(rotulos == 3, d1), dados(rotulos == 3, d2), 'go');
endfunction;

function d = d(p, q)
  d = (p.+q).^2;
endfunction;

load grupoDados1;
rotuloPrevisto = meuKnn(grupoTrain, trainRots, grupoTest, 1);
estaCorreto = rotuloPrevisto == testRots;
numCorreto = sum(estaCorreto);
totalNum = length(testRots);
precisao = numCorreto / totalNum;