# Autores: Guilherme Murilo da Rosa, Guilherme Sautner, Jean Pereira
clear all;clc; close all;

# (a) carrega os dados que ser�o trabalhados
load data.mat data

# (b) separa os valores das casas e cria a matrix com os valores independentes 
y = data(:,[3]) # y data[3] valores das casas 
casas = length(y)
# xN matrix valores independentes (tamanho casa e numero data[1] de quartos data[2]
X = [ones(casas, 1) data(:,1) data(:,2)]

# Efetua calculo da regre
b = regmultipla(X, y)

# (d)  apresenta gr�fico dos dados 
scatter3 ( X(:,2), X(:,3), y )
xlabel ( "Tamanho da Casa" )
ylabel ( "Numero de Quartos" )
zlabel ( "Pre�o" )

hold on 
# (e) tra�a as linhas da regress�o
plot3 ( X(:,2), X(:,3), (X*b))

# Correla��o Tamanho da casa e Pre�o
 rTamanho = correlacao( X(:,2) , y)

# Correla��o Quartos e Pre�o
 rQuartos = correlacao( X(:,3) , y);

# (f) apresenta no gr�fico os valores de correla��o
 title(strcat("Coeficientes de correla��o entre: ", "\n",  
              " Tamanho da casa e Pre�o (", num2str(rTamanho), ")\n",
              " N�mero de quartos e Pre�o (", num2str(rQuartos), ")" ))

# (g) Calculo para uma casa com Tamanho 1650 e 3 quartos
valorCasa = [ 1, 1650, 3 ] * b
