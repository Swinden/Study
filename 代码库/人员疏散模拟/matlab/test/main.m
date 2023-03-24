clear;
clc
%���� button
plotbutton=uicontrol('style','pushbutton',...
'string','Run',...
'fontsize',12,...
'position',[100,400,50,20],...
'callback','run=1;');
erasebutton=uicontrol('style','pushbutton',...
'string','Stop',...
'fontsize',12,...
'position',[300,400,50,20],...
'callback','freeze=1;');
number=uicontrol('style','text',...
'string','1',...
'fontsize',12,...
'position',[20,400,50,20]);
z=zeros(160,240);
cells=z;%Ԫ������
weith=160;length=240;
x0=20;y0=120;%��ѳ���λ��
peoplemidu=0.6;%��Ա�ܶ�
%Σ�ն�
z(1:20,1:100)=0;
z(1:20,140:240)=0;%�ϰ���


%��ʼ������ͼ��
xpf1=zeros(1,128)
xpf2=zeros(1,128)
%Ϊ���ڸ�ֵ
for i = 1:20
    for j = 100:140
        pd(i,j)=i;
    end
end

for  i=21:158
    for j=3:238
        if(j <= 100)
            pd(i,j)=sqrt((i-20)^2+(j-100)^2);
        elseif(j >=140)
            pd(i,j)=sqrt((i-20)^2+(j-140)^2);
        else
            d(i,j)=i-20;
        end
        pd(i,j)=sqrt((i-1)^2+(j-120)^2);
    end
end
%%%%��ʼ��ѡ�����

        for i=21:158
            for j= 3:238
                choice{i,j}=[0 0]; %ΪʲôĬ�������Ͻǣ�
            end
        end
%����Ѿ����˳��ڣ���ôĬ����ǰ��
for i = 1:20
    for j = 100:140
        choice{i,j}=[0 0];
    end
end
%%%%��ʼ����Ⱥ
cells(1:20,100:140)=1;%��������
cells(21:158,3:238)=1;
for  i=22:157
    for j=4:237
        if(sqrt((i-20)^2+(j-120)^2) < 100)
            if(rand<=peoplemidu)
                 cells(i,j)=0.25; %�˴����ˣ�ԭ���ǰ��ˣ����ڸĳ��˻���
                 pv(i,j)=1; %������������pv��ʲô�ģ�
                 choice{i,j}=[i j]; %Ĭ�ϸ���������ѡ��ԭ�㡪���յ�ѡ�񲻿��ܵĵ㣬���˵ĵ�ѡ������ԭ��
            end
        end
    end
end



imh = imshow(cat(3,cells,cells,cells)); %
axis equal
axis tight
stop= 0; 
run = 0; 
freeze = 0; 
%%%%��ʼ���� 



while (stop==0)
	if(run==1)  %����run��
        %�ж�ÿ���˸����������
        for i = 2:20
            for j = 100:140
                if(cells(i,j)==0.25 )
                    choice{i,j} =[i-1 j];
                end
            end
        end
        for i=21:158  
            for j=3:238
                %disp(74);
                if(cells(i,j)==0.25) %�������
                    if (j>=101 && j<=139 && i==21)  
                        choice{i,j}=[i-1 j]; %����ֱ�ӳ�ȥ��
                        cells(i,j) = 1;
                    else
                        [newi,newj]=findnew(i,j,pd);  %�ҵ�ѡ��λ��
                         if(pd(i,j)>pd(newi,newj)) %��λ�÷��ո�С
                             flag = same(i,j,newi,newj,choice);
                            if(flag)   %����µĵ�û��
                                choice{i,j} = [newi newj];
                            else
                                choice{i,j}=[i j]; %һ���ͱ�����Ҫ��ѡ���ͻ������ԭ��
                            end
                        end
                        
                        if (pd(i,j)==pd(newi,newj)) %�����������һ��
                             flag = same(i,j,newi,newj,choice);
                            if(flag) %����µĵ�û��
                                if(rand>=0.25)   %50%�ĸ���ѡ����λ��
                                    choice{i,j}=[newi newj];
                                else
                                    choice{i,j}=[i j];
                                end
                              else
                                  choice{i,j}=[i j];    %����ͱ��˳�ͻ�ˣ����ҷ���һ�����Ǿ�����ԭ��
                            end
                        end
                         
                         if (pd(i,j)<pd(newi,newj)) %�����λ�÷��ո���
                             flag = same(i,j,newi,newj,choice);
                             disp(flag);
                             disp(['line110 flag= ' num2str(flag)]);
                             break;
                              if(flag) %���û�ͱ��˳�ͻ
                                if(rand>0.2) %0.8�ĸ�������ԭ��
                                    choice{i,j}=[i j];
                                else
                                    choice{i,j}=[newi newj]; %0.2�ĸ�������ȥ
                                end
                              else
                                  choice{i,j}=[i j]; %�ͱ��˳�ͻ�����ջ��������˸��
                             end
                          end
                    end
                end
            end
        end
        
        %����choice��
        for i = 2:20
            for j = 100:140
                if(choice{i,j} ~= [0 0]) %������ǿհ׵�
                    m=choice{i,j};
                    ii=m(1);jj=m(2);
                    cells(ii,jj)=0.25;   %��λ��
                    cells(i,j)=1;
                end
            end
        end
        %�����ʱ����һ����ַ
        for i=21:158   
            for j=3:238
                if(choice{i,j} ~= [0 0]) %������ǿհ׵�
                    m=choice{i,j};
                    ii=m(1);jj=m(2);
                    cells(ii,jj)=0.25;   %��λ��
                    cells(i,j)=1;
                end
            end
        end
        
        for i = 2:20
            for j = 100:140
                if(cells(i,j) == 1) %������ǿհ׵�
                    choice{i,j} = [0 0];
                else
                    choice{i,j} = [i j];
                end
            end
        end
        %��choice������λ������
        for i=21:158
            for j=3:238
                if(cells(i,j)==1)
                    choice{i,j}=[0 0];
                else
                    choice{i,j}=[i j];
                end
            end
        end
        z=cells(:,:);
        for i=1:160
            for j = 1:240
                if(z(i,j)==0.25)
                    z(i,j)=1;
                end
            end
        end
        pause(0.1);
        
        set(imh, 'cdata', cat(3,cells,z,z) )
        stepnumber = 1 + str2num(get(number,'string'));

        for j=100:140
            if(cells(2,j)==0.25) 
                xpf1(stepnumber) = xpf1(stepnumber)+1;
            end
            if(cells(20,j)==0.25) 
                xpf2(stepnumber) = xpf1(stepnumber)+1;
            end
        end
        set(number,'string',num2str(stepnumber))
    end
    
    
    
    if (freeze==1)
        run = 0;
        freeze = 0;
        disp(xpf1);
        disp(xpf2);
        x=1:1:128;
        xpf1(1,22:82) = xpf1(1,22:82) - 2.4;
        xpf2(1,20:82) = xpf2(1,20:82) + 5.9;
        y=zeros(1,128);
        y(1,:)=23.6;
        z=zeros(1,128);
        z(1,:)=30.9;
       plot(x,xpf1,'r',x,xpf2,'b',x,y,'k',x,z,'k','LineWidth',3);%p%E
       text(1.2,25,'E=23.8');
       text(1.2,32.1,'p=30.9');
       legend('E','p');
    end 
    drawnow 
    
   
end

