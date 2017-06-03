function rotuloPrevisto = meuKnn(grupoTrain, trainRots, grupoTest, k)
%Para cada exemplo de teste
% Calcule a distância entre o exemplo de teste e os dados de treinamento

% Ordene as distâncias. A ordem iX de cada elemento ordenado é importante:
% [distOrdenada ind] = sort(...);
% O rótulo previsto corresponde ao rótulo do exemplo mais próximo (iX(1))
  for i=1 : size(grupoTest)
    p = grupoTest(i,:);
    for y=1 : size(grupoTrain)
      q = grupoTrain(y,:);
      trainRots(y) = dist(p, q);
     end;
     disp('cu');
  end;
  rotuloPrevisto = 0;
endfunction;