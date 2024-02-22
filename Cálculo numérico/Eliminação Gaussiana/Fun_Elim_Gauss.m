function [a] = Fun_Elim_Gauss(a);
%Gauss elimination code
a = [1 6 2 0; 3 2 4 -1; 1 6 1 1; 2 1 3 0];
N = length(a);
tol = 1e-6;
%for each pivot along the diagonal
for ii = 1:N-1% ii é a linha
    %for each row under the pivot
    for jj=ii+ 1:N
        if abs(a(jj,ii)) > tol
    
    fac = a(ii,ii)/a(jj, ii);
    a(jj,:) = fac*a(jj,:) - a(ii,:);
        end
    end 
    a
end