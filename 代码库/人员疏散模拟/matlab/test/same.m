%%%%  判断是否已经选择重复
function rt=same(i,j,newi,newj,choice)
    rt=1;
    %disp(155)
    k = 0;
    for m = i-2:i+2
        for n = j-2:j+2
            if(m == i && n == j)
                continue;
            elseif(m <= 21 || m >= 158 || n <= 3 || n >= 238)
                continue;
            end
            if(k == 24)
                rt = 1;
                break;
            end
            %disp(['m= ' num2str(m) ' n= ' num2str(n) 'choice{m,n}= '  num2str(choice{m,n}) ' [newi newj]= ' num2str([newi newj])]);
            if([newi newj]==choice{m,n})   
                
                rt=0;%
                break; %disp(['i= ' num2str(i) ' j= ' num2str(j) 'choice{i,j}= ' num2str(choice{i,j}) ' [newi newj]= ' num2str([newi newj]) ' k= ' num2str(k)]);       
            end
            k = k+1;
        end
    end
end