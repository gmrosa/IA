% Realiza a recombinação dos cromossomos e gera dois filhos
function [filho1 filho2]=cycle(pai1, pai2, indC)
  filho1 = pai1;
  filho2 = pai2;
  cromossomo = pai2(indC);
  filho1(indC) = cromossomo;
  filho2(indC) = pai1(indC); 
  
  for i=1:length(pai1)
    if i!=indC
      if filho1(i) == cromossomo
        [filho1 filho2] = cycle(filho1, filho2, i);
      end
    end
  end
end