function ySol = calculaSolucaoAnali(pontoInicial, strFuncao)
syms y(t) t

f = eval(strFuncao);

equacao = diff(y,t) == f;
cond = y(pontoInicial(1)) == pontoInicial(2);
ySol(t) = dsolve(equacao, cond);