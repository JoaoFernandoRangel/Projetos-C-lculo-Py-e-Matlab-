function [res, coe] = Do_zerp 
a = [-2 3 1 -5; 2 1 4 -9; 4 10 -6 2];
tamanho = size(a);
Linhas = tamanho(1);
Colunas = tamanho(2);
tol = 1e-6;
%ii é a coluna
%jj é a linha
for ii = 1:Colunas-1    
    for jj= ii+1:Linhas
        if abs(a(jj,ii)) > tol
            %isso limita o valor da divisão para numeros maiores que "zero"
   fator = a(ii,ii)/a(jj,ii);
    %essa linha toma o fator de cada primeiro elemento não nulo de uma
    %linha e o divide pelo elemento acima deste
    a(jj,:) = fator*a(jj,:) - a(ii,:);
    
    %essa linha faz a alteração da coluna inteira
    %o indice ii representa a coluna e o ":" faz pegar a linha inteira
        end
    end
    
end
for k=1:3
 resultados(k,1)=a(k,4);%faz retornar a matriz do resultados
end 

for l=1:3
    for c=1:3
coeficientes(l,c)=a(l,c);
    end

end

res=[resultados]
coe=[coeficientes]






