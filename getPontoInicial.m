function [pontoInicial] = getPontoInicial(extremoDireito)
% Pede ao utilizador as coordenadas do ponto inicial
c=0;
while c == 0
    a = str2double(input('Insira a abcissa do ponto inicial: ', 's'));
    if isnan(a)
        fprintf(2, 'Insira um valor numérico\n');
    elseif isempty(extremoDireito)
        c = 1;
    elseif a >= extremoDireito
        fprintf(2,'Insira um valor menor que o extremo Direito\n');
    else
        c=1;
    end
end

c = str2double(input('Insira a ordenada do ponto inicial: ', 's'));
while isnan(c)
    fprintf(2, 'Insira um valor numérico\n');
    c = str2double(input('Defina a ordenada do ponto inicial: ', 's'));
end

pontoInicial = [a c];
end

