function [h, erros] = calculaErro(strFuncao, pontoInicial, ...
                                  extremoDireito, metodo, ...
                                  numIntervalosInicial, numeroPassos)
% Esta função apresenta o erro absoluto entre a solução analítica e a
% solução aproximada de um dos métodos

% Inicialização
h = zeros(numeroPassos, 1);
erros = zeros(numeroPassos, 1);
passoInicial = (extremoDireito - pontoInicial(1)) / numIntervalosInicial;
funcao = str2func(['@(t,y)', strFuncao]);

% Para cada ponto do gráfico
for i = 1 : numeroPassos
    % Calcula o passo começando em 0,25 e indo dividindo por 2 e guarda-o
    h(i) = passoInicial / 2 ^(i - 1);
    % Calcula o número de intervalos correspondente ao passo atual
    numeroIntervalos = (extremoDireito - pontoInicial(1)) / h(i);
    % Calcula o erro e guarda-o
    [~, yNum] = calculaSolucaoNum(funcao, pontoInicial, ...
                                  extremoDireito, numeroIntervalos, ...
                                  metodo);
    ySolAnali = calculaSolucaoAnali(pontoInicial, strFuncao);
    erros(i) = abs(yNum(length(yNum)) - ySolAnali(extremoDireito));
end
h = flipud(h);
erros = flipud(erros);
end

