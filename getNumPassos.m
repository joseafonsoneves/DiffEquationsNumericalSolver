function numPassos = getNumPassos
% Pede ao utilizador o número de passos a utilizar no traçado do gráfico e
% verifica a sua validade
a=0;
while a==0
    numPassos = str2double(input('Defina o número de passos a utilizar (mínimo de 5): ', 's'));
    if isnan(numPassos) || round(numPassos)~=numPassos
        fprintf(2, 'Insira um número natural\n');
    elseif numPassos < 5
        fprintf(2, 'Número de passos demasiado pequeno\n');
    else
        a=1;
    end
end
end