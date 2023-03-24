clc, clear, syms x
y=diff(log((1+x)/(1-x)),3)
y=simplify(y)