function alineaA
% Resolve a alínea a
funcao = @(t, y) -10 * y;
pontoInicial = [0 0.5];
extremoDireito = 1;
funcaoSolAnali = @(t) exp(-10 * t) * 0.5;

a = 0;
while a == 0
    fprintf(2, '\n                Alínea a                \n');
    opcaoAlineas = getOpcaoAlineas;
    switch opcaoAlineas
        case 'A'
            numPassos = 10; % Número de erros em função de passos a calcular
            hInicial = 0.1;
            h = zeros(numPassos, 1);
            erros = zeros(numPassos, 1);
            comprimentoIntervalo = extremoDireito - pontoInicial(1);
            
            metodo = getMetodo;
            
            for i = 1 : numPassos
                h(i) = hInicial / 2 ^ (i - 1);
                numIntervalos = comprimentoIntervalo / h(i);
                
                [~, yRK3] = calculaSolucaoNum(funcao, pontoInicial, extremoDireito, numIntervalos, metodo);
                yAnaliFinal = funcaoSolAnali(extremoDireito);
                erros(i) = abs(yRK3(length(yRK3)) - yAnaliFinal);
            end
            
            loglog(h, erros);
            alteraGraf(metodo, 'exp(-10 * t) * 0.5', 'E');
            input('Clique qualquer tecla para continuar --> ','s');
            close;
        case 'B'
            metodo = getMetodo;
            numIntervalos = 20;
            
            [x, y] = calculaSolucaoNum(funcao, pontoInicial, extremoDireito, numIntervalos, metodo);
            
            plot(x, y, 'r',x, funcaoSolAnali(x), 'b');
            alteraGraf(metodo, 'exp(-10 * t) * 0.5', 'R');
            
            fprintf('Número de intervalos = %1.0f\n', numIntervalos);
            input('Clique qualquer tecla para continuar --> ','s');
            close;
        case 'S'
            a = 1;
    end
end