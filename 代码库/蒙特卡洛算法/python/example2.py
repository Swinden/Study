# 2.计算函数定积分值
import random

def cal_integral_mc(n = 1000000):
    x_min, x_max = 0.0, 1.0
    y_min, y_max = 0.0, 1.0
    m = 0
    for i in range(0, n+1):
        x = random.uniform(x_min, x_max)
        y = random.uniform(y_min, y_max)
        # x*x > y 表示该点位于曲线的下面。
        if x*x > y:
            m += 1
    #所求的积分值即为曲线下方的面积与正方形面积的比
    return m / float(n)

a=cal_integral_mc(10000000)
print(a)
