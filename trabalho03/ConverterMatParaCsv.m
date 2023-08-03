% Carregar o arquivo .mat
matfile = load("C:\Users\eline\Desktop\bancoDados.mat");

% Extrair os dados do arquivo .mat
dados = struct2cell(matfile);

% Converter os dados em um arquivo CSV
csvwrite('dados.csv', dados);

% Carregar o arquivo .mat
%matfile = load('Classe2.mat');

% Extrair os dados do arquivo .mat
dados = struct2cell(matfile);

% Converter os dados em um arquivo CSV
%csvwrite('Classe2.csv', dados);