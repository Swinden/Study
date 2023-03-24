%%%%%%%  寻找新位置
function [newi,newj]=findnew(i,j,pd)
    if(i==158)
        newi = i-1;
        newj = j;
    end
    if(j == 3)
        newi = i;
        newj = j+1;
    end
    if(j == 238)
        newi = i;
        newj = j-1;
    end
    if(i == 21 && j <= 100)
        newi = i;
        newj = j+1;
    end
    if(i == 21 && j >= 140)
        newi = i;
        newj = j-1;
    end
    
    if(i>=22&&i<=157&&j>=4&&j<=237)
        a=[pd(i-1,j) pd(i-1,j+1) pd(i-1,j-1) pd(i,j-1) pd(i,j+1) pd(i+1,j-1) pd(i+1,j) pd(i+1,j+1)];    %找到危害最小的地方
        [m,n]=min(a);
        switch n
            case 1
                newi=i-1;newj=j;
            case 2
                 newi=i-1;newj=j+1;      
            case 3
                 newi=i-1;newj=j-1;
            case 4
                 newi=i;newj=j-1;
            case 5 
                newi=i;newj=j+1;
            case 6
                 newi=i+1;newj=j-1;      
            case 7
                 newi=i+1;newj=j;
            otherwise
                 newi=i+1;newj=j+1;
        end
    end
end

