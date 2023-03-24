# 固定起点和终点要求路径不闭合（因为如果路径是闭合的，固定与不固定结果实际上是一样的）

# 假设你的起点和终点坐标指定为(0, 0) 和 (1, 1)，这样构建目标函数

# # 起点和终点不参与优化。假设共有n+2个点，优化对象是中间n个点
# # 目标函数（总距离）按实际去写.


import numpy as np
from scipy import spatial
import matplotlib.pyplot as plt

num_points = 20

points_coordinate = np.random.rand(num_points, 2)  # generate coordinate of points
start_point=[[0,0]]
end_point=[[1,1]]
points_coordinate=np.concatenate([points_coordinate,start_point,end_point])
distance_matrix = spatial.distance.cdist(points_coordinate, points_coordinate, metric='euclidean')


def cal_total_distance(routine):
    '''The objective function. input routine, return total distance.
    cal_total_distance(np.arange(num_points))
    '''
    num_points, = routine.shape
    # start_point,end_point 本身不参与优化。给一个固定的值，参与计算总路径
    routine = np.concatenate([[num_points], routine, [num_points+1]])
    return sum([distance_matrix[routine[i], routine[i + 1]] for i in range(num_points+2-1)])


# 正常运行并画图：

from sko.GA import GA_TSP

ga_tsp = GA_TSP(func=cal_total_distance, n_dim=num_points, size_pop=50, max_iter=500, prob_mut=1)
best_points, best_distance = ga_tsp.run()


fig, ax = plt.subplots(1, 2)
best_points_ = np.concatenate([[num_points],best_points, [num_points+1]])
best_points_coordinate = points_coordinate[best_points_, :]
ax[0].plot(best_points_coordinate[:, 0], best_points_coordinate[:, 1], 'o-r')
ax[1].plot(ga_tsp.generation_best_Y)
plt.show()
