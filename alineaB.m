function alineaB
% Resolve a alínea a
funcao = @(t, y) -y + sin(t);
pontoInicial = [0 1];
extremoDireito = 2;
funcaoSolAnali = @(t) -sqrt(2) * cos(t+pi./4) ./2 + 1.5 * exp(-t);

a = 0;
while a == 0
    fprintf(2, '\n                Alínea b                \n');
    opcaoAlineas = getOpcaoAlineas;
    switch opcaoAlineas
        case 'A'
            numPassos = 10; % Número de erros em função de passos a calcular
            hInicial = 0.2;
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
            alteraGraf(metodo, '-sqrt(2) * cos(t+pi./4) ./2 + 1.5 * exp(-t)', 'E');
            input('Clique qualquer tecla para continuar --> ','s');
            close;
        case 'B'
            numIntervalos = 20;
            metodo = getMetodo;

            [x, y] = calculaSolucaoNum(funcao, pontoInicial, extremoDireito, numIntervalos, metodo);

            plot(x, y, 'r', x, funcaoSolAnali(x), 'b');
            alteraGraf(metodo, '-sqrt(2) * cos(t+pi./4) ./2 + 1.5 * exp(-t)', 'R');

            fprintf('Número de intervalos = %1.0f\n', numIntervalos);
            input('Clique qualquer tecla para continuar --> ','s');
            close;
        case 'S'
            a = 1;
    end
end

