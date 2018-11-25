% Matem�tica Computacional MEAer 2018/2019 

% Trabalho realizado por: Catarina Lobo - n� 89653
%                         Jos� Neves    - n� 89683
%                         Rodrigo Rosa  - n� 90355


% Mensagem de boas-vindas
fprintf(2,'\n**** Bem-vindo ao programa EquationSolver! ****\n');
fprintf(' Este programa permite a resolu��o de equa��es diferenciais de primeira ordem\n');
fprintf('utilizando os m�todos de Euler progressivo e Runge-Kutta de 2�, 3� e 4� ordens!\n');
% Menu inicial
a = 0;
while a == 0
    fprintf(2, '\n        Menu Inicial          ');
    fprintf('\n-----------------------------\n');
    fprintf('|O que pretende fazer?      |\n')
    fprintf('-----------------------------\n');
    fprintf('|A - Al�nea a               |\n');
    fprintf('|B - Al�nea b               |\n');
    fprintf('|C - Outras funcionalidades |\n');
    fprintf('|D - Problema do avi�o      |\n');
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
            fprintf(2, '\n Op��o inv�lida\n');
    end
end

fprintf(2,'\n***** EquationSolver *****\n');
clear;