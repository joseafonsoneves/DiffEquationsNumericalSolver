function numPassos = getNumPassos
% Pede ao utilizador o n�mero de passos a utilizar no tra�ado do gr�fico e
% verifica a sua validade
a=0;
while a==0
    numPassos = str2double(input('Defina o n�mero de passos a utilizar (m�nimo de 5): ', 's'));
    if isnan(numPassos) || round(numPassos)~=numPassos
        fprintf(2, 'Insira um n�mero natural\n');
    elseif numPassos < 5
        fprintf(2, 'N�mero de passos demasiado pequeno\n');
    else
        a=1;
    end
end
end