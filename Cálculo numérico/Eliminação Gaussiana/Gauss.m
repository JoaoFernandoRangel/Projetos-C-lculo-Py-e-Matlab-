function [ ret ] = ElimGaussiana( A )
%ELIMGAUSSIANA Summary of this function goes here
%   Detailed explanation goes here

tamanho=size(A)
linhas=tamanho(1)
colunas=tamanho(2)
% pause


for k=1:(linhas-1);    %  marcador do pivô
    % -------------------- ETAPA DE PIVOTEAMENTO ------------------------
    
    v=A(k:linhas,k)
    linhadopivo = pivoteamento(v)+(k-1)
    % pause
    aux=A(linhadopivo,:)
    A(linhadopivo,:)=A(k,:)
    A(k,:)=aux
    % pause
    
    % ----------------------------------------------------------------
    
    % --------------------- ETAPA DE ELIMINAÇÃO -----------------------
    
    
    for i=k+1:linhas
        mult=A(i,k)/A(k,k)   % k é a linha do pivô => A(k,k) é o pivô
        for j=1:colunas
            A(i,j)=A(i,j)-mult*A(k,j);
           % pause
           % A
        end
    end
end
    

% -------------- ETAPA DE RETROSSUBSTITUIÇÃO -----------------------------
    
x(linhas) = A(linhas,colunas) / A(linhas,colunas-1); % determina o valor da variável da última linha
for i=linhas-1:-1:1
	x(i)=A(i,colunas);
	for j=i+1:linhas % soma as variáveis já determinadas
		x(i)=x(i)-A(i,j)*x(j);
	end
x(i)=x(i)/A(i,i); % determina o valor da i-ésima variável
end;

ret=x;

end




function [ ret ] = pivoteamento( v )
%PIVOTEAMENTO Summary of this function goes here
%   Detailed explanation goes here

tamanho=size(v);     % ordem da matriz v
linhas=tamanho(1);      % número de linhas da matriz v
%pause
maior = abs(v(1,1));
linhadomaior = 1;
%pause
for i=2:linhas
   if abs(v(i,1))>maior;
       maior = v(i,1);
       linhadomaior=i;
       %pause
   end
end

ret = linhadomaior;

end