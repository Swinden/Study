function err=Bpfun(x,P,T,hiddennum,P_test,T_test)
%% 训练&测试BP网络
%% 输入
% x：一个个体的初始权值和阈值
% P：训练样本输入
% T：训练样本输出
% hiddennum：隐含层神经元数
% P_test:测试样本输入
% T_test:测试样本期望输出
%% 输出
% err：预测样本的预测误差的范数

inputnum=size(P,1);       % 输入层神经元个数
outputnum=size(T,1);      % 输出层神经元个数
%% 新建BP网络
net=newff(P,T,[hiddennum,outputnum],{'tansig','logsig'},'trainlm');
%% 设置网络参数：训练次数为1000，训练目标为0.01，学习速率为0.1
net.trainParam.epochs=1000;
net.trainParam.goal=0.01;
net.trainParam.lr = 0.1;
net.trainParam.show=NaN;
% net.trainParam.showwindow=false;  %高版MATLAB使用 不显示图形框
%% BP神经网络初始权值和阈值
w1num=inputnum*hiddennum; % 输入层到隐层的权值个数
w2num=outputnum*hiddennum;% 隐含层到输出层的权值个数
w1=x(1:w1num);   %初始输入层到隐含层的权值
B1=x(w1num+1:w1num+hiddennum);  %隐层神经元阈值
w2=x(w1num+hiddennum+1:w1num+hiddennum+w2num); %初始隐层到输出层的权值
B2=x(w1num+hiddennum+w2num+1:w1num+hiddennum+w2num+outputnum); %输出层阈值
net.iw{1,1}=reshape(w1,hiddennum,inputnum);
net.lw{2,1}=reshape(w2,outputnum,hiddennum);
net.b{1}=reshape(B1,hiddennum,1);
net.b{2}=reshape(B2,outputnum,1);
%% 训练网络
net=train(net,P,T);
%% 测试网络
Y=sim(net,P_test);
err=norm(Y-T_test);
