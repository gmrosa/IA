# Autores: Guilherme Murilo da Rosa, Guilherme Sautner, Jean Pereira
% fun��o que calcula o beta 1
function b1 = bUm(x, y, xMedia, yMedia)
  b1 = (sum((x.-xMedia).*(y.-yMedia))/sum((x.-xMedia).^2));
end;