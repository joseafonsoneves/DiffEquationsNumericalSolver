function [metodo] = getMetodo
% Pede ao utilziador o método a utilizar e verifica-o
a = 0;
while a == 0
    fprintf('-------------------------------------------\n');
    fprintf('|Escolha o método a utilizar:             |\n');
    fprintf('-------------------------------------------\n');
    fprintf('|A - Método de Euler progressivo          |\n');
    fprintf('|B - Método de Runge-Kutta de 2ª ordem    |\n');
    fprintf('|C - Método de Runge-Kutta de 3ª ordem    |\n');
    fprintf('|D - Método de Runge-Kutta de 4ª ordem    |\n');
    fprintf('-------------------------------------------\n');
    metodo = input('--> ','s');
    
    if ~strcmp(metodo,'A') && ~strcmp(metodo,'B') && ~strcmp(metodo,'C') && ~strcmp(metodo,'D')
        fprintf(2, 'Opção Inválida!\n');
    else
        a = 1;
    end
end
end