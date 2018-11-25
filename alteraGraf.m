function alteraGraf(metodo, strFuncao, grafico)
% Adiciona informa��es ao gr�fico

switch grafico
    % Se for um gr�fico de erro
    case 'E'
        xlabel('Log(Passo) (h)');
        ylabel('Log(Erro Absoluto)');
        title(['Representa��o do erro absoluto da fun��o f(t,y)=',strFuncao]);
        % Se for um gr�fico de resolu��o
    case 'R'
        xlabel('t');
        ylabel('y');
        title(['Representa��o da solu��o da fun��o f(t,y)=',strFuncao]);
        switch metodo
            case 'A'
                legend('M�todo de Euler Progressivo','Solu��o exata');
            case 'B'
                legend('M�todo de Runge-Kutta de 2� ordem','Solu��o exata');
            case 'C'
                legend('M�todo de Runge-Kutta de 3� ordem','Solu��o exata');
            case 'D'
                legend('M�todo de Runge-Kutta de 4� ordem','Solu��o exata');
        end
    case 'A'
        xlabel('Instante (s)');
        ylabel('Velocidade (m/s)');
end
%Quando apenas h� uma curva no gr�fico
if grafico ~= 'R'
    switch metodo
        case 'A'
            legend('M�todo de Euler Progressivo');
        case 'B'
            legend('M�todo de Runge-Kutta de 2� ordem');
        case 'C'
            legend('M�todo de Runge-Kutta de 3� ordem');
        case 'D'
            legend('M�todo de Runge-Kutta de 4� ordem');
    end
end
    
end
