function opcao = getOpcaoAlineas

a = 0;
while a== 0
    fprintf('-------------------------------------------\n');
    fprintf('|Escolha o que fazer:                     |\n');
    fprintf('-------------------------------------------\n');
    fprintf('|A - An�lise do erro                      |\n');
    fprintf('|B - Representa��o das solu��es num�ricas |\n');
    fprintf('|S - Sair                                 |\n');
    fprintf('-------------------------------------------\n');
    opcao = input('--> ','s');
    
    if ~strcmp(opcao,'A') && ~strcmp(opcao,'B') && ~strcmp(opcao,'S')
        fprintf(2, 'Op��o Inv�lida!\n');
    else
        a = 1;
    end  
end