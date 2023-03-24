clc, clear
a=[-1 -2 0;-1 0 0];b=[-1;0];               %两个线性约束条件
[x,y]=ga(@obj,3,a,b,[],[],[],[],@constr);  %调用遗传算法函数
x, y=-y

function y=obj(x);           %定义目标函数，其中x为行向量
c1 = [2 3 1]; c2 = [3 1 0];
y = c1*x' + c2*x'.^2; y=-y;  %ga中目标函数极小化
end

function [f,g]=constr(x);  %定义约束条件函数
f=[x(1)+2*x(1)^2+x(2)+2*x(2)^2+x(3)-10
   x(1)+x(1)^2+x(2)+x(2)^2-x(3)-50
   2*x(1)+x(1)^2+2*x(2)+x(3)-40];
g=x(1)^2+x(3)-2;
end



