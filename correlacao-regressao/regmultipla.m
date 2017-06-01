# Autores: Guilherme Murilo da Rosa, Guilherme Sautner, Jean Pereira
% Calculo da Regressão Linear Múltipla
function [b] = regmultipla(X, y)

# (Transposta X * X)^-1 * Transposta X * y/valores
b = ((X' * X)^(-1)) * X' * y ;
# 

end;