# Autores: Guilherme Murilo da Rosa, Guilherme Sautner, Jean Pereira
% Calcula a regress�o
function [b0 b1 yt] = regressao(x, y)
  yMedia = mean(y);
  xMedia = mean(x);  
  b1 = bUm(x,y,xMedia,yMedia);
  b0 = bZero(x,y,xMedia,yMedia,b1);
  yt = (b0+b1*x);
end;