# 第一步：定义问题
demo_func = lambda x: x[0] ** 2 + (x[1] - 0.05) ** 2 + x[2] ** 2


# %% Do SA
# 第二步，运行模拟退火算法
from sko.SA import SA

sa = SA(func=demo_func, x0=[1, 1, 1], T_max=1, T_min=1e-9, L=300, max_stay_counter=150)
best_x, best_y = sa.run()
print('best_x:', best_x, 'best_y', best_y)

# %% Plot the result
# 第三步，画出结果 
import matplotlib.pyplot as plt
import pandas as pd

plt.plot(pd.DataFrame(sa.best_y_history).cummin(axis=0))
plt.show()



# %%
from sko.SA import SACauchy

sa_cauchy = SACauchy(func=demo_func, x0=[1, 1, 1], T_max=1, T_min=1e-9, q=0.99, L=300, max_stay_counter=150)
sa_cauchy.run()
print('Cauchy Simulated Annealing: best_x is ', sa_cauchy.best_x, 'best_y is ', sa_cauchy.best_y)

# %%
from sko.SA import SACauchy

sa_cauchy = SACauchy(func=demo_func, x0=[1, 1, 1], T_max=1, T_min=1e-9, q=0.99, L=300, max_stay_counter=150,
                     lb=[-1, 1, -1], ub=[2, 3, 4])
sa_cauchy.run()
print('Cauchy Simulated Annealing with bounds: best_x is ', sa_cauchy.best_x, 'best_y is ', sa_cauchy.best_y)