function [x, y] = calculaSolucaoNum(funcao, pontoInicial, extremoDireito, ...
                                    numIntervalos, metodo)
% A fun��o getSolucao tem como objetivo a resolu��o num�rica de
% equa��es diferenciais de 1� ordem utilizando o m�todo de Runge-Kutta de
% 3� ordem e o m�todo de Euler progressivo

% Inicializa��o dos dados de sa�da
x = zeros(numIntervalos + 1, 1);
y = zeros(numIntervalos + 1, 1);
% Preenche nos vetores das coordenadas as do ponto inicial
x(1) = pontoInicial(1);
y(1) = pontoInicial(2);

% Calcula passo atrav�s do extremo direito do intervalo, do ponto inicial
% e do n�mero de pontos indicado
h = (extremoDireito - pontoInicial(1)) / numIntervalos;

% Itera sobre o intervalo desde o segundo ponto inclusive ao ponto final
for i = 2 : numIntervalos + 1
    K1 = funcao(x(i-1), y(i-1));
    
    switch metodo
        case 'A'
            y(i) = y(i - 1) + h * K1;
        case 'B'
            K2 = funcao(x(i-1) + h, y(i-1) + K1 * h);
            y(i) = y(i - 1) + 0.5 * h * (K1 + K2);
        case 'C'
            K2 = funcao(x(i-1) + 2/3 * h, y(i-1) + 2/3 * K1 * h);
            K3 = funcao(x(i-1) + 2/3 * h, y(i-1) + 2/3 * K2 * h);
            y(i) = y(i - 1) + h * (1/4 * K1 + 3/8 * K2 + 3/8 * K3);
        case 'D'
            K2 = funcao(x(i-1) + 1/2 * h, y(i-1) + 1/2 * K1 * h);
            K3 = funcao(x(i-1) + 1/2 * h, y(i-1) + 1/2 * K2 * h);
            K4 = funcao(x(i-1) + h, y(i-1) + K3 * h);
            y(i) = y(i - 1) + h * (K1 / 6 + K2 / 3 + K3 / 3 + K4 / 6);
    end
    
    x(i) = x(i - 1) + h;
end
end