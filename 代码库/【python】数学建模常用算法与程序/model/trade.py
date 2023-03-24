import numpy as np
import pandas as pd
import matplotlib.pyplot as plt
a=pd.read_excel("数据集/Trade.xlsx")
a['year']=a.Date.dt.year  #添加交易年份字段
a['month']=a.Date.dt.month  #添加交易月份字段
plt.rc('font',family='SimHei') #用来正常显示中文标签

ax1=plt.subplot(2,3,1)   #建立第一个子图窗口
Class_Counts=a.Order_Class[a.year==2012].value_counts()
Class_Percent=Class_Counts/Class_Counts.sum()
ax1.set_aspect(aspect='equal')  #设置纵横轴比例相等
ax1.pie(Class_Percent,labels=Class_Percent.index,
        autopct="%.1f%%")  #添加格式化的百分比显示
ax1.set_title("2012年各等级订单比例")

ax2=plt.subplot(232)  #建立第2个子图窗口
#统计2012年每月销售额
Month_Sales=a[a.year==2012].groupby(by='month').aggregate({'Sales':np.sum})
#下面使用Pandas画图
Month_Sales.plot(title="2012年各月销售趋势",ax=ax2, legend=False)
ax2.set_xlabel('')

ax3=plt.subplot(2,3,(3,6))
cost=a['Trans_Cost'].groupby(a['Transport'])
ts = list(cost.groups.keys())
dd = np.array(list(map(cost.get_group, ts)), dtype=object)
plt.boxplot(dd); plt.gca().set_xticklabels(ts)

ax4=plt.subplot(2,3,(4,5))
plt.hist(a.Sales[a.year==2012],bins=40, density=True)
ax4.set_title("2012年销售额分布图");
ax4.set_xlabel("销售额");
plt.savefig("可视化/figure2_45.png"); plt.show()
