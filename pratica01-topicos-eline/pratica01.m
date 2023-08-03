
%% Nome da Tarefa: Prática de simulação 1
%% Autor: Maria Eline Silva de Farias - 516229

clear all
close all
clc

%% 1- Carregue o arquivo de áudio fornecido botao.wav [audioread]. Gere o gráfico deste sinal de áudio [plot].
[y,Fs] = audioread('botao.wav')
%--------2 canais
% t = linspace(0,length(y)/Fs,length(y));
% plot(t,y);
% xlabel('time');
% ylabel('y[n]'); 
%---------1 canal
y = y(:,1);
dt = 1/Fs;
t = 0:dt:(length(y)*dt)-dt;
plot(t,y); 
xlabel('time'); 
ylabel('Amplitude');
figure
%Estimativa da densidade espectral de potência (PSD)
plot(psd(spectrum.periodogram,y,'Fs',Fs,'NFFT',length(y)));
figure
%%


%% 2-) Escute este sinal utilizando a função sound, tendo como argumento o sinal y e a fequência de amostragem Fs fornecidos pela função audioread.
sound(y, Fs);
%%


%% 3-) Gere o histograma do sinal de áudio [hist] usando 100 barras.
hist(y,100)
title('Histograma', 'FontSize',18)
xlabel('Valores')
ylabel('Frequencia')
%%


%%  4-) Calcule a assimetria e a curtose do sinal ruidoso [skewness,kurtosis]. Estes valores eram esperados? Justifique sua resposta em forma de comentário logo abaixo desta questão.
%retorna a assimetria da amostra de y.
% Se X for um vetor, skewness(X)retorna um valor escalar que é a 
% assimetria dos elementos em X.
media = mean(y)
mediana = median(y)
desvioPadrao = std(y)
variancia = var(y)
valorMaximo = max(y)
vaorMinimo = min(y)
a = [skewness(y),kurtosis(y)]

%% Resultados: a = 0.2348(assimetria) 3.3862(curtose)

% A skewness é uma medida da assimetria dos dados em torno da média da amostra. 
% Se a assimetria for negativa, os dados se espalharão mais à esquerda da média.Se a assimetria for positiva,
% os dados se espalharão mais para a direita. Conforme os dados tornam-se simétricos, seu valor de assimetria aproxima-se de 
% zero. Se Observarmos o histograma gerado no item 3 e o vaor da media que
% é 0,0809 podemos notar que os dados apresentam um comportamento quase
% totalmente simétrico em relação a media e portanto teriamos um valor
% proximo de 0 para a medida de assimetria.
% Curtose é uma medida de quão propensa a outliers é uma distribuição. A curtose da distribuição normal
% é 3. As distribuições que são mais propensas a outliers do que a distribuição normal têm curtose 
% maior que 3; distribuições que são menos propensas a outliers têm curtose
% menor que 3. Novamente se observamos o histogrma e compararmos com o de
% uma distribuição normal podemos notar que o final das caudas apresentam
% diferenças, pois nesse caso especifico notamos que existe uma tendência de
% crescimento dos valores,que difere de uma distribuição normal que tem o
% padrão de "caimento" nas caldas. Mas como esse crescimento é bem pequeno
% o valor obtido da curtose um pouco acima de 3 condiz com o esprado.
%%


%% 5) Divida o sinal ruidoso em 12 partes de aproximadamente 5.000 amostras. Em seguida, calcule a média temporal de cada uma destas partes [mean]. A média é constante ou varia com o tempo? Coloque a resposta em forma de comentário logo abaixo desta questão. 
%% Divisão do sinal em 12 partes, onde cada parte possui 5120 amostras)
p1 = y(1:5120)
p2 = y(5121:10240)
p3 = y(10241:15360)
p4 = y(15361:20480)
p5 = y(20481:25600)
p6 = y(25601:30720)
p7 = y(30721:35840)
p8 = y(35841:40960)
p9 = y(40961:46080)
p10 = y(46081:51200)
p11 = y(51201:56320)
p12 = y(56321:end)
%% tamanho de cada parte, para simples conferência da divisão do sinal
tamP1 = size(p1) 
tamP2 = size(p2)
tamP3 = size(p3)
tamP4 = size(p4) 
tamP5 = size(p5)
tamP6 = size(p6)
tamP7 = size(p7) 
tamP8 = size(p8)
tamP9 = size(p9)
tamP10 = size(p10) 
tamP11 = size(p11)
tamP12 = size(p12)
%% Calculo das médias
mediaTemporalDoSinal = [mean(p1),mean(p2),mean(p3), 
                 mean(p4),mean(p5),mean(p6),
                 mean(p7),mean(p8),mean(p9),
                 mean(p10),mean(p11),mean(p12)]
%% Resultados das médias
% 0.8816    0.1583    0.0031
% -0.0233   -0.0077    0.0136
% -0.0348   -0.0201    0.0022
% -0.0007   -0.0001   -0.0011

%% observando os valores podemos notar em ocorre variação ao longo do tempo

%% 6) Ainda usando a divisão do sinal em 12 partes com 5.000 amostras cada, calcule a função de autocorrelação de cada uma das partes do sinal, usando 30 valores de atraso [autocorr(y,30)]. A função de autocorrelação é a mesma para
%%  todas as partes? Coloque a resposta em forma de comentário logo abaixo desta questão.

autocorrelacaoSinal = [autocorr(p1,30),autocorr(p2,30), autocorr(p3,30), autocorr(p4,30),autocorr(p5,30), autocorr(p6,30), autocorr(p7,30),autocorr(p8,30), autocorr(p9,30), autocorr(p10,30),autocorr(p11,30), autocorr(p12,30)]

% Os valores obtidos para a autocorrelação está no arquivo word dentro da dessa mesma pasta.
% A funcao autocorr é usada para medir a relação entre o valor atual dos elementos e os valores passados ​​do mesmo elemento.
% observando os valores pode-se notar existe sim, diferenças entre os
% valores, variando conforme a amostra.
%%

%%  7-) Com base nas questões 5 e 6, você considera que o sinal é estacionário no sentido amplo? Coloque a resposta em forma de comentário logo abaixo desta questão.
% Para  um processo ser definido como um processo estacionário no sentido amplo seu valor
% médio deve ser constante para todo n e não é o que ocorre, como observado
% no item 5 e portanto pode-se concluir que o processo não é estacionário
% no sentido amplo. Além disso, para o processo ser estacionário de sentido amplo, a função de autocorrelação do processo deve ser independente de um deslocamento da origem dos tempos. 
% o que não acontece, pois os valores da função de autocorrelação também
% estão variando.
%%




















