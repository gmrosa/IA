function rotuloPrevisto = meuKnn(grupoTrain, trainRots, grupoTest, k)
%Para cada exemplo de teste
% Calcule a dist�ncia entre o exemplo de teste e os dados de treinamento

% Ordene as dist�ncias. A ordem iX de cada elemento ordenado � importante:
% [distOrdenada ind] = sort(...);
% O r�tulo previsto corresponde ao r�tulo do exemplo mais pr�ximo (iX(1))
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