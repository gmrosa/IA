# Autores: Guilherme Murilo da Rosa, Guilherme Sautner, Jean Pereira
%  mede o grau de relacionamento linear entre valores x e y
function r = correlacao(x, y)
  yMedia = mean(y);
  xMedia = mean(x);  
  %{ 
  Soma ((x – média de x) * (y – média de y))
  - Dividido -
  Raiz quadrada ( (soma de (x – média de x)2) * (soma de (y – média de y)2 ))
  %}
  r = sum((x.-xMedia).*(y.-yMedia))/sqrt(sum((x.-xMedia).^2)*sum((y.-yMedia).^2));  
end;