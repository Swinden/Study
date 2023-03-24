# 3.计算函数极值，可避免陷入局部极值
import numpy as np
import random


def cal_extremum_mc(n = 1000000):
    y_max = 0.0
    x_min, x_max = -2.0, 2.0
    y = lambda x:200*np.sin(x)*np.exp(-0.05*x)#匿名函数
    for i in range(0, n+1):
        x0 = random.uniform(x_min, x_max)
        if y(x0) > y_max:
            y_max = y(x0)
            x_max = x0
    return y_max, x_max


a=cal_extremum_mc(100000000)
print(a)
