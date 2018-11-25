% Matemática Computacional MEAer 2018/2019 

% Trabalho realizado por: Catarina Lobo - nº 89653
%                         José Neves    - nº 89683
%                         Rodrigo Rosa  - nº 90355


% Mensagem de boas-vindas
fprintf(2,'\n**** Bem-vindo ao programa EquationSolver! ****\n');
fprintf(' Este programa permite a resolução de equações diferenciais de primeira ordem\n');
fprintf('utilizando os métodos de Euler progressivo e Runge-Kutta de 2ª, 3ª e 4ª ordens!\n');
% Menu inicial
a = 0;
while a == 0
    fprintf(2, '\n        Menu Inicial          ');
    fprintf('\n-----------------------------\n');
    fprintf('|O que pretende fazer?      |\n')
    fprintf('-----------------------------\n');
    fprintf('|A - Alínea a               |\n');
    fprintf('|B - Alínea b               |\n');
    fprintf('|C - Outras funcionalidades |\n');
    fprintf('|D - Problema do avião      |\n');
    fprintf('|S - Sair                   |\n');
    fprintf('-----------------------------\n');
    opcao = input('--> ', 's');

    switch opcao
        case 'A'
            alineaA;
        case 'B'
            alineaB;
        case 'C'
            strFuncao = getStrFuncao;
            pontoInicial = getPontoInicial('');
            extremoDireito = getExtremoDireito(pontoInicial(1));
            menuFuncionalidades(strFuncao, pontoInicial, extremoDireito);
        case 'D'
            problemaAviao();
        case 'S'
            a = 1;
        otherwise
            fprintf(2, '\n Opção inválida\n');
    end
end

fprintf(2,'\n***** EquationSolver *****\n');
clear;