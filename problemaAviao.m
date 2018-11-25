function problemaAviao()
%Resolve o problema do instante de travagem do avião
sair = 0;
while sair == 0
    fprintf(2, '\n                Problema do avião                 \n');
    fprintf('--------------------------------------------------\n');
    fprintf('|Escolha o modo de utilização:                   |\n');
    fprintf('--------------------------------------------------\n');
    fprintf('|A - Sistema de Travagem: dv/dt = -0.02*v^2-0.9  |\n');
    fprintf('|    Condição Inicial: v=300 km/h                |\n');
    fprintf('|B - Outros Sistemas de Travagem.                |\n');
    fprintf('|S - Sair                                        |\n');
    fprintf('--------------------------------------------------\n');
    opcao = input('--> ', 's');

    switch opcao
        case 'A'         
            solveAviao('-0.02 * y^2 - 0.9', [0 (300 / 3.6)], 20, 50, 'C');
        case 'B'
            fprintf('\nDefina os parâmetros a e b da equação do sistema de travagem, que tem a forma\n');
            fprintf('F(t,y) = -a*y^2 - b, com a>0 e b>0.\n');
            a = input('a = ');
            b = input('b = ');
            strFuncao = sprintf('-%d * y^2 - %d', a, b);

            fprintf('\nDefina o instante de tempo inicial (s) e a velocidade inicial (km/h), respetivamente a abcissa e ordenada do ponto inicial.\n');
            pontoInicial = getPontoInicial('');
            pontoInicial(2) = pontoInicial(2) / 3.6; % Conversão para m/s

            fprintf('\nDefina o intervalo de tempo onde pretende saber se o avião se imobiliza.\n');
            fprintf('Sugestão: Intervalos de tempo muito grandes dão origem a erros de aproximação.\n');
            extremoDireito = getExtremoDireito(pontoInicial(1));
            
            metodo = getMetodo();
            numIntervalos = getNumIntervalos('');
            
            solveAviao(strFuncao, pontoInicial, extremoDireito, numIntervalos, metodo);
        case 'S'
            sair = 1;
        otherwise
            fprintf(2,'\nOpção inválida!\n\n');
    end
end
end

function solveAviao(strFuncao, pontoInicial, extremoDireito, numIntervalos, metodo)
    funcao = str2func(['@(t,y)', strFuncao]);
    
    %calcula a solução através de um dos métodos
    [x, y] = calculaSolucaoNum(funcao, pontoInicial, extremoDireito, numIntervalos, metodo);

    for i = 1 : numIntervalos
        %Encontra a 1ª abcissa do ponto dado pelo método cuja ordenada é 0
        %Apenas para sistemas de travagem
        if (y(i) > 0 && y(i+1) <= 0)
            zero = x(i+1) - x(1); %Intervalo de tempo
            fprintf('-------------------------------------------------------|\n');
            fprintf('O avião imobiliza-se ao fim de %f segundos.\n', zero);
            fprintf('-------------------------------------------------------|\n');
            
            plot(x, y, '-r+', [0 extremoDireito], [0 0], 'g');
            alteraGraf(metodo, strFuncao, 'A');
            break;
        end 

        %caso a função não tenha um zero no intervalo considerado
        if i == numIntervalos
            plot(x, y);
            alteraGraf(metodo, strFuncao, 'A');
            fprintf('O avião não se imobiliza no intervalo considerado.\n'); 
        end  
    end
    input('Clique em alguma tecla para continuar --> ','s');
    close;
end                  
            