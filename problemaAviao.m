function problemaAviao()
%Resolve o problema do instante de travagem do avi�o
sair = 0;
while sair == 0
    fprintf(2, '\n                Problema do avi�o                 \n');
    fprintf('--------------------------------------------------\n');
    fprintf('|Escolha o modo de utiliza��o:                   |\n');
    fprintf('--------------------------------------------------\n');
    fprintf('|A - Sistema de Travagem: dv/dt = -0.02*v^2-0.9  |\n');
    fprintf('|    Condi��o Inicial: v=300 km/h                |\n');
    fprintf('|B - Outros Sistemas de Travagem.                |\n');
    fprintf('|S - Sair                                        |\n');
    fprintf('--------------------------------------------------\n');
    opcao = input('--> ', 's');

    switch opcao
        case 'A'         
            solveAviao('-0.02 * y^2 - 0.9', [0 (300 / 3.6)], 20, 50, 'C');
        case 'B'
            fprintf('\nDefina os par�metros a e b da equa��o do sistema de travagem, que tem a forma\n');
            fprintf('F(t,y) = -a*y^2 - b, com a>0 e b>0.\n');
            a = input('a = ');
            b = input('b = ');
            strFuncao = sprintf('-%d * y^2 - %d', a, b);

            fprintf('\nDefina o instante de tempo inicial (s) e a velocidade inicial (km/h), respetivamente a abcissa e ordenada do ponto inicial.\n');
            pontoInicial = getPontoInicial('');
            pontoInicial(2) = pontoInicial(2) / 3.6; % Convers�o para m/s

            fprintf('\nDefina o intervalo de tempo onde pretende saber se o avi�o se imobiliza.\n');
            fprintf('Sugest�o: Intervalos de tempo muito grandes d�o origem a erros de aproxima��o.\n');
            extremoDireito = getExtremoDireito(pontoInicial(1));
            
            metodo = getMetodo();
            numIntervalos = getNumIntervalos('');
            
            solveAviao(strFuncao, pontoInicial, extremoDireito, numIntervalos, metodo);
        case 'S'
            sair = 1;
        otherwise
            fprintf(2,'\nOp��o inv�lida!\n\n');
    end
end
end

function solveAviao(strFuncao, pontoInicial, extremoDireito, numIntervalos, metodo)
    funcao = str2func(['@(t,y)', strFuncao]);
    
    %calcula a solu��o atrav�s de um dos m�todos
    [x, y] = calculaSolucaoNum(funcao, pontoInicial, extremoDireito, numIntervalos, metodo);

    for i = 1 : numIntervalos
        %Encontra a 1� abcissa do ponto dado pelo m�todo cuja ordenada � 0
        %Apenas para sistemas de travagem
        if (y(i) > 0 && y(i+1) <= 0)
            zero = x(i+1) - x(1); %Intervalo de tempo
            fprintf('-------------------------------------------------------|\n');
            fprintf('O avi�o imobiliza-se ao fim de %f segundos.\n', zero);
            fprintf('-------------------------------------------------------|\n');
            
            plot(x, y, '-r+', [0 extremoDireito], [0 0], 'g');
            alteraGraf(metodo, strFuncao, 'A');
            break;
        end 

        %caso a fun��o n�o tenha um zero no intervalo considerado
        if i == numIntervalos
            plot(x, y);
            alteraGraf(metodo, strFuncao, 'A');
            fprintf('O avi�o n�o se imobiliza no intervalo considerado.\n'); 
        end  
    end
    input('Clique em alguma tecla para continuar --> ','s');
    close;
end                  
            