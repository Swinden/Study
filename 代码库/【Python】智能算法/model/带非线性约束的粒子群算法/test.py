# 加入你的非线性约束是个圆内的面积 (x[0] - 1) ** 2 + (x[1] - 0) ** 2 - 0.5 ** 2<=0
# 这样写代码:

# constraint_ueq = (
#     lambda x: (x[0] - 1) ** 2 + (x[1] - 0) ** 2 - 0.5 ** 2
#     ,
# )
# pso = PSO(func=demo_func, n_dim=2, pop=40, max_iter=max_iter, lb=[-2, -2], ub=[2, 2]
#           , constraint_ueq=constraint_ueq)
# 可以有多个非线性约束，向 constraint_ueq 加就行了。