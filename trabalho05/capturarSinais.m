palavras = {'um', 'dois', 'três'};
numRepeticoes = 15;
tempoPorCaptura = 2; % Tempo em segundos para cada captura de áudio

for i = 1:length(palavras)
    palavra = palavras{i};
    
    for j = 1:numRepeticoes
        disp(['Pressione a tecla para iniciar a captura de áudio de "', palavra, '" - repetição ', num2str(j)]);
        pause;
        
        disp('Capturando áudio...');
        recorder = audiorecorder;
        recordblocking(recorder, tempoPorCaptura);
        disp('Captura de áudio concluída.');
        
        % Salvar o sinal de voz em um arquivo
        dados = sprintf('%s_%02d.wav', palavra, j);
       audiowrite(fullfile('C:\Users\eline\Downloads\dados', dados), getaudiodata(recorder), recorder.SampleRate);
    end
end
 