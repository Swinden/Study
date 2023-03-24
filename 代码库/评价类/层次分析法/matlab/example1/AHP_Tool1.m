%判断矩阵A是不是正互反矩阵
function [judge] = AHP_Tool1(A)
n = size(A,1);
for i=1:n
    for j=1:n
        a = A(i,j);
        b = A(j,i);
        if a*b==1
            continue;
        else
            judge = false;
            return;
        end
    end
end
judge = true;
end
