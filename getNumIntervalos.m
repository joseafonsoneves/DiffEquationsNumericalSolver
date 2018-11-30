function numIntervalos = getNumIntervalos(modo)
% Pede ao utilizador o passo inicial para traçado do gráfico e verifica-o
a = 0;
while a == 0
    if modo == 'B'
        numIntervalos = str2double(input(['Defina o número de ', ...
                                         'intervalos inicial: '], 's'));
    else
        numIntervalos = str2double(input(['\nDefina o número de ', ...
                                         'intervalos: '], 's'));
    end
    
    if isnan(numIntervalos) || round(numIntervalos) ~= numIntervalos ...
       || numIntervalos < 1
        fprintf(2, 'Por favor insira um número natural\n');
    else
        a = 1;
    end
end