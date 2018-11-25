function alteraGraf(metodo, strFuncao, grafico)
% Adiciona informações ao gráfico

switch grafico
    % Se for um gráfico de erro
    case 'E'
        xlabel('Log(Passo) (h)');
        ylabel('Log(Erro Absoluto)');
        title(['Representação do erro absoluto da função f(t,y)=',strFuncao]);
        % Se for um gráfico de resolução
    case 'R'
        xlabel('t');
        ylabel('y');
        title(['Representação da solução da função f(t,y)=',strFuncao]);
        switch metodo
            case 'A'
                legend('Método de Euler Progressivo','Solução exata');
            case 'B'
                legend('Método de Runge-Kutta de 2ª ordem','Solução exata');
            case 'C'
                legend('Método de Runge-Kutta de 3ª ordem','Solução exata');
            case 'D'
                legend('Método de Runge-Kutta de 4ª ordem','Solução exata');
        end
    case 'A'
        xlabel('Instante (s)');
        ylabel('Velocidade (m/s)');
end
%Quando apenas há uma curva no gráfico
if grafico ~= 'R'
    switch metodo
        case 'A'
            legend('Método de Euler Progressivo');
        case 'B'
            legend('Método de Runge-Kutta de 2ª ordem');
        case 'C'
            legend('Método de Runge-Kutta de 3ª ordem');
        case 'D'
            legend('Método de Runge-Kutta de 4ª ordem');
    end
end
    
end
