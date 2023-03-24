# 在多维优化时，想让哪个变量限制为整数，就设定 precision 为 整数 即可。
# 例如，我想让我的自定义函数 demo_func 的某些变量限制为整数+浮点数（分别是隔2个，隔1个，浮点数），那么就设定 precision=[2, 1, 1e-7]


from sko.GA import GA

demo_func = lambda x: (x[0] - 1) ** 2 + (x[1] - 0.05) ** 2 + x[2] ** 2
ga = GA(func=demo_func, n_dim=3, max_iter=500, lb=[-1, -1, -1], ub=[5, 1, 1], precision=[2, 1, 1e-7])
best_x, best_y = ga.run()
print('best_x:', best_x, '\n', 'best_y:', best_y)



# 说明：

# # 当 precision 为整数时，对应的自变量会启用整数规划模式。
# # 在整数规划模式下，变量的取值可能个数最好是 $2^n$，这样收敛速度快，效果好。
# # 如果 precision 不是整数（例如是0.5）,则不会进入整数规划模式，如果还想用这个模式，那么把对应自变量乘以2，这样 precision 就是整数了.