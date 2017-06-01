# Autores: Guilherme Murilo da Rosa, Guilherme Sautner, Jean Pereira
clear all;clc; close all;

# (a) carrega os dados que serão trabalhados
load data.mat data

# (b) separa os valores das casas e cria a matrix com os valores independentes 
y = data(:,[3]) # y data[3] valores das casas 
casas = length(y)
# xN matrix valores independentes (tamanho casa e numero data[1] de quartos data[2]
X = [ones(casas, 1) data(:,1) data(:,2)]

# Efetua calculo da regre
b = regmultipla(X, y)

# (d)  apresenta gráfico dos dados 
scatter3 ( X(:,2), X(:,3), y )
xlabel ( "Tamanho da Casa" )
ylabel ( "Numero de Quartos" )
zlabel ( "Preço" )

hold on 
# (e) traça as linhas da regressão
plot3 ( X(:,2), X(:,3), (X*b))

# Correlação Tamanho da casa e Preço
 rTamanho = correlacao( X(:,2) , y)

# Correlação Quartos e Preço
 rQuartos = correlacao( X(:,3) , y);

# (f) apresenta no gráfico os valores de correlação
 title(strcat("Coeficientes de correlação entre: ", "\n",  
              " Tamanho da casa e Preço (", num2str(rTamanho), ")\n",
              " Número de quartos e Preço (", num2str(rQuartos), ")" ))

# (g) Calculo para uma casa com Tamanho 1650 e 3 quartos
valorCasa = [ 1, 1650, 3 ] * b
