function opcao = getOpcaoAlineas

a = 0;
while a== 0
    fprintf('-------------------------------------------\n');
    fprintf('|Escolha o que fazer:                     |\n');
    fprintf('-------------------------------------------\n');
    fprintf('|A - Análise do erro                      |\n');
    fprintf('|B - Representação das soluções numéricas |\n');
    fprintf('|S - Sair                                 |\n');
    fprintf('-------------------------------------------\n');
    opcao = input('--> ','s');
    
    if ~strcmp(opcao,'A') && ~strcmp(opcao,'B') && ~strcmp(opcao,'S')
        fprintf(2, 'Opção Inválida!\n');
    else
        a = 1;
    end  
end