function [extremoDireito] = getExtremoDireito(xPontoInicial)
% Pede ao utilizador o extremo direito do intervalo
a = 0;
while a == 0
    extremoDireito = str2double(input('Defina o extremo direito: ', 's'));
    
    if isnan(extremoDireito)
        fprintf(2, 'Insira um valor numérico\n');
    elseif xPontoInicial >= extremoDireito
        fprintf(2, 'O extremo direito deve ser maior que o esquerdo\n');
    else
        a = 1;
    end
end