function [metodo] = getMetodo
% Pede ao utilziador o m�todo a utilizar e verifica-o
a = 0;
while a == 0
    fprintf('-------------------------------------------\n');
    fprintf('|Escolha o m�todo a utilizar:             |\n');
    fprintf('-------------------------------------------\n');
    fprintf('|A - M�todo de Euler progressivo          |\n');
    fprintf('|B - M�todo de Runge-Kutta de 2� ordem    |\n');
    fprintf('|C - M�todo de Runge-Kutta de 3� ordem    |\n');
    fprintf('|D - M�todo de Runge-Kutta de 4� ordem    |\n');
    fprintf('-------------------------------------------\n');
    metodo = input('--> ','s');
    
    if ~strcmp(metodo,'A') && ~strcmp(metodo,'B') && ~strcmp(metodo,'C') && ~strcmp(metodo,'D')
        fprintf(2, 'Op��o Inv�lida!\n');
    else
        a = 1;
    end
end
end