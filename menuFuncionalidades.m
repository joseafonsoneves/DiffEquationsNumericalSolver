function menuFuncionalidades (strFuncao, pontoInicial, extremoDireito)
% Permite escolher o modo de utilização do programa 

funcao = str2func(['@(t,y)', strFuncao]);

cond = 1;
while cond == 1
    fprintf(2,'\n             Menu Funcionalidades               \n');
    fprintf('--------------------------------------------------\n');
    fprintf('|Escolha o modo de utilização:                   |\n');
    fprintf('--------------------------------------------------\n');
    fprintf('|A - Resolver numericamente a equação diferencial|\n');
    fprintf('|B - Analisar o erro cometido em função do passo |\n');
    fprintf('|C - Alterar o ponto inicial                     |\n');
    fprintf('|D - Alterar o extremo direito                   |\n');
    fprintf('|E - Alterar a equação                           |\n');
    fprintf('|S - Sair                                        |\n');
    fprintf('--------------------------------------------------\n');
    opcao = input('--> ','s');
    
    switch opcao
        case 'A'
            syms yAnali(t) t
            numIntervalos = getNumIntervalos('A');
            metodo = getMetodo;
            
            yAnali = calculaSolucaoAnali(pontoInicial,strFuncao);
            [xNum, yNum] = calculaSolucaoNum(funcao, pontoInicial, extremoDireito, numIntervalos, metodo);
            erro = abs(yAnali(extremoDireito) - yNum(length(yNum)));
            
            fprintf('A aproximação tem um erro absoluto de %f.\n', erro);
            plot(xNum, yNum, '-r+', xNum, yAnali(xNum), 'g');
            alteraGraf(metodo, strFuncao, 'R');
            input('\nClique qualquer botão para voltar ao menu Funcionalidades -->','s');
            close;
        case 'B'
            numIntervalos = getNumIntervalos('B');
            numPassos = getNumPassos;
            metodo = getMetodo;
            
            [h, erros1] = calculaErro(strFuncao, pontoInicial, extremoDireito, ...
                                      metodo, numIntervalos, numPassos);
            
            loglog(h, erros1);
            alteraGraf(metodo, strFuncao, 'E');
            input('\nClique qualquer botão para voltar ao menu Funcionalidades -->','s');
            close;
        case 'C'
            pontoInicial = getPontoInicial(extremoDireito);
        case 'D'
            extremoDireito = getExtremoDireito(pontoInicial(1));
        case 'E'
            strFuncao = getStrFuncao;
            funcao = str2func(['@(t,y)',strFuncao]);
        case 'S'
            cond = 0;
        otherwise
            fprintf(2, "Opção inválida");
    end
end