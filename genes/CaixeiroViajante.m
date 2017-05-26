close all; clc; clear;

global iag x y pop novaGeracao
%% Configuracao Inicial
npar=20; % numero das variaveis para serem otimizadas (genes)
Nt=npar; % numero de colunas da matriz de populacao

x=rand(1,npar);
y=rand(1,npar); % cidades em (cidadeX, cidadeY)
% Adiciona o numero maximo de interacoes (Criterio de Parada)
maxit=10000;
% Parametros do AG
% tamanho da populacao
tamPop=20;
% taxa de mutacao (probabilidade de 0.05)
txMutacao = 0.05;
selecao=0.5; % fracao da populacao a ser mantida
manter=floor(selecao*tamPop); % numero de membros da populacao que sobrevivem
M=ceil((tamPop-manter)/2); % numero de cruzamentos

% calculo da probabilidade para a selecao dos pais
probab=1; %probabilidade
for ii=2:manter
  probab=[probab ii*ones(1,ii)];
end
Nprobab=length(probab);
probab=manter-probab+1; 

% Gerar a populacao inicial
iag=0; % contador para iniciar a geracao
% gerar a populacao aleatoria (Veja funcao randperm)
for i = 0:tamPop
  pop = vertcat(pop, randperm(npar));
endfor
#disp('populacaoInicial');
#disp(pop);
% deve ser uma matriz 20x20 (cromossomo + n. da populacao)

%calcular o custo da populacao utilizando a funcao de aptidao
custoPop = cvfun(pop);
% colocar o custo minimo no elemento 1 (Veja funcao sort)
% organizar a populacao com o custo mais baixo primeiro
[custos ind] = sort(custoPop);
% calcula o custo minimo da populacao (veja funcao min)
custoMinimo = min(custos);
menorCusto = custoMinimo;
melhorSolucao = pop(ind(1),:);
% calcula a media aritmetica da populacao (veja funcao mean)
medVal = mean(custos);

%% Interacao pelas geracoes (LOOP PRINCIPAL)
while iag<maxit
  novaGeracao = [];
  iag=iag+1; % incrementa o contador de geracoes
  
  % Escolha do Pai1 e Pa2 que são escolhidos aleatoriamente do vetor
  % probab
  escolha1=ceil(Nprobab*rand(1,M)); % escolher aleatoriamente na roleta os indivíduos
  escolha2=ceil(Nprobab*rand(1,M)); % escolher aleatoriamente na roleta os indivíduos
  indPai1=probab(escolha1); % selecionar os indices escolhidos na roleta para o pai 1
  indPai2=probab(escolha2); % selecionar os indices escolhidos na roleta para o pai 2
  % Execucao da Recombinacao (crossover)
  for ic=1:M
    %seleciona o Pai 1
    pai1 = pop(indPai1(ic), :);
    %seleciona o Pai 2  
    pai2 = pop(indPai2(ic), :);
    % Faz a técnica de recombinação Cycle
    % Gera um indice aleatorio do cromossomo que será mutado entre os pais
    indC = randi(npar,1);
    [filho1 filho2] = cycle(pai1,pai2,indC);
    novaGeracao = vertcat(novaGeracao, filho1);    
    novaGeracao = vertcat(novaGeracao, filho2);       
  end
  
  % Faz a Mutacao da nova populacao
  for im=1:rows(novaGeracao)
    % Calculo de probabilidade 1 = 0.05% de 2000
    mutacao = randi(2000,1)==1;
    if mutacao
      % Seleciona as posições de mutação
      pos1 = randi(npar,1);
      pos2 = randi(npar,1);
      % Apenas para garantir que não vai trocar com ele mesmo
      while pos1==pos2
        pos2 = randi(npar,1);  
      end
      % Troca o cromossomo da respectiva posição
      geneMutado = novaGeracao(im, :);
      cromossomo = geneMutado(pos1);
      geneMutado(pos1) = geneMutado(pos2);
      geneMutado(pos2) = cromossomo;
      novaGeracao(im, :) = geneMutado;
    end
  end
  % Elimita a pior metade
  for ip=1:manter
    indMelhor = ind(ip);
    novaGeracao = vertcat(novaGeracao, pop(indMelhor, :));              
  endfor
  
  pop = novaGeracao;
  #disp('novageracao');
  #disp(pop);  
    
  % Calcula um novo custo para a nova população
  custoPop = cvfun(pop);
  %_______________________________________________________
  % Organiza em ordem crescente os custos e associa aos parametros
  [custos ind] = sort(custoPop);
  custoMinimo = min(custos); 
  if(custos(1) < menorCusto)
    menorCusto = custos(1);
    melhorSolucao = pop(ind(1),:);
  endif  
end %iga
%_______________________________________________________
% Mostrar os resultados

disp('Numero de geracoes: ');
disp(maxit);
disp('Tamanho da Populacao: ');
disp(tamPop);
disp('Taxa de Mutacao : ');
disp(txMutacao);
disp('Numero de Cidades: ');
disp(npar)
disp('Melhor Custo: ');
disp(menorCusto);
disp('Melhor Solucao: ');
disp(melhorSolucao);

% Fecha o ciclo para printar %
pop = [pop pop(:,1)];
plot(x(pop(1,:)),y(pop(1,:)),x(pop(1,1)),y(pop(1,1)),x,y,'*');