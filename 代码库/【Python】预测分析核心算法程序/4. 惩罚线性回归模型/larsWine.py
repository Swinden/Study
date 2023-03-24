#!/usr/bin/env python3
# encoding: utf-8
'''
@file: larsWine.py
@time: 2020/6/13 0013 8:59
@author: Jack
@contact: jack18588951684@163.com
'''

import urllib.request
import numpy as np
from sklearn import datasets, linear_model
from math import sqrt
import matplotlib.pyplot as plt

## 读取数据集
target_url = ("http://archive.ics.uci.edu/ml/machine-learning-databases/wine-quality/winequality-red.csv")
data = urllib.request.urlopen(target_url)
xList = []
labels = []
names = []
firstLine = True
for line in data:
    if firstLine:
        names = str(line, encoding='utf-8').strip().split(";")
        firstLine = False
    else:
        row = str(line, encoding='utf-8').strip().split(";")
        labels.append(float(row[-1]))
        row.pop()
        floatRow = [float(num) for num in row]
        xList.append(floatRow)

nrows = len(xList)
ncols = len(xList[0])

## 计算均值方差
xMean = []
xSD = []
for i in range(ncols):
    col = [xList[j][i] for j in range(nrows)]
    mean = sum(col) / nrows
    xMean.append(mean)
    colDiff = [(xList[j][i] - mean) for j in range(nrows)]
    sumSq = sum([colDiff[i] * colDiff[i] for i in range(nrows)])
    stdDev = sqrt(sumSq / nrows)
    xSD.append(stdDev)

## 归一化属性和标签
xNormalized = []
for i in range(nrows):
    rowNormalized = [(xList[i][j] - xMean[j]) / xSD[j] for j in range(ncols)]
    xNormalized.append(rowNormalized)

meanLabel = sum(labels) / nrows
sdLabel = sqrt(sum([(labels[i] - meanLabel) * (labels[i] - meanLabel) for i in range(nrows)]) / nrows)
labelNormalized = [(labels[i] - meanLabel) / sdLabel for i in range(nrows)]

## 权重矩阵初始化
beta = [0.0] * ncols

betaMat = []
betaMat.append(list(beta))

nSteps = 350  ## 迭代次数
stepSize = 0.004  ## 步长
for i in range(nSteps):
    residuals = [0.0] * nrows
    for j in range(nrows):
        ## 预测值
        labelsHat = sum([xNormalized[j][k] * beta[k] for k in range(ncols)])
        ## 误差
        residuals[j] = labelNormalized[j] - labelsHat

    ## 计算相关度
    corr = [0.0] * ncols

    for j in range(ncols):
        corr[j] = sum([xNormalized[k][j] * residuals[k] for k in range(nrows)]) / nrows

    iStar = 0
    corrStar = corr[0]

    for j in range(1, (ncols)):
        if abs(corrStar) < abs(corr[j]):
            iStar = j
            corrStar = corr[j]
    ## 权重更新
    beta[iStar] += stepSize * corrStar / abs(corrStar)
    betaMat.append(list(beta))

for i in range(ncols):
    coefCurve = [betaMat[k][i] for k in range(nSteps)]
    xaxis = range(nSteps)
    plt.plot(xaxis, coefCurve)

plt.xlabel("Steps Taken")
plt.ylabel("Coefficient Values")
plt.show()
