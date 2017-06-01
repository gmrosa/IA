# Autores: Guilherme Murilo da Rosa, Guilherme Sautner, Jean Pereira
clear all;clc; close all;

# Três grupos de dados (datasets)
x1 = [10;8;13;9;11;14;6;4;12;7;5];
y1 = [8.04;6.95;7.58;8.81;8.33;9.96;7.24;4.26;10.84;4.82;5.68];

x2 = [10;8;13;9;11;14;6;4;12;7;5];
y2 = [9.14;8.14;8.47;8.77;9.26;8.10;6.13;3.10;9.13;7.26;4.74];

x3 = [8;8;8;8;8;8;8;8;8;8;19];
y3 = [6.58;5.76;7.71;8.84;8.47;7.04;5.25;5.56;7.91;6.89;12.50];

# tive que criar essa variável por causa do problema de precisão na comparação do double
tolerancia = 0.000001;

# Primeiro dataset --------------------------------------------------------------
figure(1);
x = x1;
y = y1;
hold on;
# 2-a Faça um grafico de dispersão
scatter (x, y);
# 2-b Calcule o coeficiente de correlação
r = correlacao(x, y);
# 2-c Trace a linha da regressão no gráfico de dispersão
[b0 b1 yt] = regressao(x, y);
plot(x, yt);
# 2-d Mostre os coeficientes de correlação e regressão no gráfico de dispersão
title(strcat(" r = ", num2str(r), ", b0 = ", num2str(b0), ", b1 = ", num2str(b1)));
hold off;
# 2-f Compare seus resultados com as funções octave corr e glmfit
# corr -----
rc = corr(x,y);
# sqtr(x^2) é tem função de módulo (torna positivo o número negativo)
if (sqrt((rc-r)^2)<tolerancia)
  disp('para o dataset 1 funcao corr deu o mesmo resultado que a funcao correlacao');
else
  disp('dataset1');
  disp('resultado fun correlacao:');
  disp(r);
  disp('resultado fun corr:');
  disp(rc);
end;
# glmfit -----
#{
 warning: the 'glmfit' function belongs to the statistics package from Octave
 Forge which you have installed but not loaded.  To load the package, run
 'pkg load statistics' from the Octave prompt.
#}
# Segundo dataset --------------------------------------------------------------
figure(2);
x = x2;
y = y2;
hold on;
# 2-a Faça um grafico de dispersão
scatter (x, y);
# 2-b Calcule o coeficiente de correlação
r = correlacao(x, y);
# 2-c Trace a linha da regressão no gráfico de dispersão
[b0 b1 yt] = regressao(x, y);
plot(x, yt);
# 2-d Mostre os coeficientes de correlação e regressão no gráfico de dispersão
title(strcat(" r = ", num2str(r), ", b0 = ", num2str(b0), ", b1 = ", num2str(b1)));
hold off;
# 2-f Compare seus resultados com as funções octave corr e glmfit
# corr -----
rc = corr(x,y);
# sqtr(x^2) é tem função de módulo (torna positivo o número negativo)
if (sqrt((rc-r)^2)<tolerancia)
  disp('para o dataset 2 funcao corr deu o mesmo resultado que a funcao correlacao');
else
  disp('dataset2');
  disp('resultado fun correlacao:');
  disp(r);
  disp('resultado fun corr:');
  disp(rc);
end;
# glmfit -----
#{
 warning: the 'glmfit' function belongs to the statistics package from Octave
 Forge which you have installed but not loaded.  To load the package, run
 'pkg load statistics' from the Octave prompt.
#}

# Terceiro dataset --------------------------------------------------------------
figure(3);
x = x3;
y = y3;
hold on;
# 2-a Faça um grafico de dispersão
scatter (x, y);
# 2-b Calcule o coeficiente de correlação
r = correlacao(x, y);
# 2-c Trace a linha da regressão no gráfico de dispersão
[b0 b1 yt] = regressao(x, y);
plot(x, yt);
# 2-d Mostre os coeficientes de correlação e regressão no gráfico de dispersão
title(strcat("(Conjunto de Dados não Apropriado para Regressão)\n", " r = ", num2str(r), ", b0 = ", num2str(b0), ", b1 = ", num2str(b1)));
hold off;
# 2-f Compare seus resultados com as funções octave corr e glmfit
# corr -----
rc = corr(x,y);
# sqtr(x^2) é tem função de módulo (torna positivo o número negativo)
if (sqrt((rc-r)^2)<tolerancia)
  disp('para o dataset 3 funcao corr deu o mesmo resultado que a funcao correlacao');
else
  disp('dataset3');
  disp('resultado fun correlacao:');
  disp(r);
  disp('resultado fun corr:');
  disp(rc);
end;
# glmfit -----
#{
 warning: the 'glmfit' function belongs to the statistics package from Octave
 Forge which you have installed but not loaded.  To load the package, run
 'pkg load statistics' from the Octave prompt.
#}