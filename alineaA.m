function alineaA
% Resolve a al�nea a
funcao = @(t, y) -10 * y;
pontoInicial = [0 0.5];
extremoDireito = 1;
funcaoSolAnali = @(t) exp(-10 * t) * 0.5;

a = 0;
while a == 0
    fprintf(2, '\n                Al�nea a                \n');
    fprintf('-------------------------------------------\n');
    fprintf('|Escolha o que fazer:                     |\n');
    fprintf('-------------------------------------------\n');
    fprintf('|A - An�lise do erro                      |\n');
    fprintf('|B - Representa��o das solu��es num�ricas |\n');
    fprintf('|S - Sair                                 |\n');
    fprintf('-------------------------------------------\n');
    opcao = input('--> ','s');
    
    switch opcao
        case 'A'
            numPassos = 10; % N�mero de erros a calcular
            hInicial = 0.025;
            h = zeros(numPassos, 1);
            erros = zeros(numPassos, 1);
            comprimentoIntervalo = extremoDireito - pontoInicial(1);
            
            metodo = getMetodo;
            
            for i = 1 : numPassos
                h(i) = hInicial / 2 ^ (i - 1);
                numIntervalos = comprimentoIntervalo / h(i);
                
                [~, y] = calculaSolucaoNum(funcao, pontoInicial, ...
                                              extremoDireito, ...
                                              numIntervalos, metodo);
                yAnaliFinal = funcaoSolAnali(extremoDireito);
                erros(i) = abs(y(length(y)) - yAnaliFinal);
            end
            p = polyfit(log(h), log(erros), 1);
            e = p(1);
            k = exp(p(2));
            fprintf('Regress�o linear: Erro = %f * h^%f.\n', k, e);
            
            loglog(h, erros);
            alteraGraf(metodo, 'exp(-10 * t) * 0.5', 'E');
            input('Clique qualquer tecla para continuar --> ','s');
            close;
        case 'B'
            metodo = getMetodo;
            numIntervalos = 20;
            
            [x, y] = calculaSolucaoNum(funcao, pontoInicial, ...
                                       extremoDireito, ...
                                       numIntervalos, metodo);
            
            plot(x, y, 'r',x, funcaoSolAnali(x), 'b');
            alteraGraf(metodo, 'exp(-10 * t) * 0.5', 'R');
            fprintf('N�mero de intervalos = %1.0f\n', numIntervalos);
            input('Clique qualquer tecla para continuar --> ','s');
            close;
        case 'S'
            a = 1;
        otherwise
            fprintf(2, 'Op��o inv�lida');
    end
end