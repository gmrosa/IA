% Calcula a regressão
function r = regressao(x, y)
  yMedia = mean(y);
  xMedia = mean(x);  
  b1 = bUm(x,y,xMedia,yMedia);
  b0 = bZero(x,y,xMedia,yMedia,b1);
  r = (b0+b1*x);
end;