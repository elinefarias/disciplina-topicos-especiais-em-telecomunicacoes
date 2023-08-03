numSinais = 45;  % Número de sinais de áudio
maxTamanho = 0;  % Comprimento máximo inicializado como zero

bancoDados = [];  % Inicializa a matriz vazia para armazenar os sinais de áudio

for i = 1:numSinais
    nomeArquivo = sprintf('audio%d.wav', i); % Atualize o formato do nome do arquivo, se necessário
    caminhoArquivo = fullfile('C:\Users\eline\Dropbox\04-TopicosDeTelecomunicacoes\trabalho05\dados', nomeArquivo);
    sinalAudio = audioread(caminhoArquivo);
    
    tamanhoSinal = length(sinalAudio);
    if tamanhoSinal > maxTamanho
        maxTamanho = tamanhoSinal;  % Atualiza o comprimento máximo, se necessário
    end
    
    bancoDados(i, :) = [sinalAudio' zeros(1, maxTamanho - tamanhoSinal)]; % Armazena o sinal de áudio na linha correspondente da matriz
end

nomeArquivoSalvar = fullfile('C:\Users\eline\Dropbox\04-TopicosDeTelecomunicacoes\trabalho05\dados', 'bancoDados.mat');
save(nomeArquivoSalvar, 'bancoDados');





