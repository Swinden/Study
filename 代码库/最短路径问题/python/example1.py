#按条数算最短路径问题
from SPP.SPP import *


graph = {'A': ['B', 'C','D'],
         'B': [ 'E'],
         'C': ['D','F'],
         'D': ['B','E','G'],
         'E': [],
         'F': ['D','G'],
         'G': ['E']}

onepath = findPath(graph,'A','G')
print('一条路径:',onepath)

allpath = findAllPath(graph,'A','G')
print('\n所有路径：',allpath)

shortpath = findShortestPath(graph,'A','G')
print('\n最短路径：',shortpath)
