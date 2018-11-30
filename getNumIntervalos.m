function numIntervalos = getNumIntervalos(modo)
% Pede ao utilizador o passo inicial para tra�ado do gr�fico e verifica-o
a = 0;
while a == 0
    if modo == 'B'
        numIntervalos = str2double(input(['Defina o n�mero de ', ...
                                         'intervalos inicial: '], 's'));
    else
        numIntervalos = str2double(input(['\nDefina o n�mero de ', ...
                                         'intervalos: '], 's'));
    end
    
    if isnan(numIntervalos) || round(numIntervalos) ~= numIntervalos ...
       || numIntervalos < 1
        fprintf(2, 'Por favor insira um n�mero natural\n');
    else
        a = 1;
    end
end