#!C:\python36\python
import pandas as pd
import time
import numpy as np
import matplotlib.pyplot as plt

# Pandas 0.23 cause problem, use 0.22
# Instal pandas lib from pip3, numpy, six, python-dateutil,pytz
'''
start_time = time.time()
print(start_time)
gl = pd.read_csv("C:\\Users\\radhapavan\\Desktop\\PyFiles\\game_logs.csv")
gl.info(memory_usage='deep')
start_time = time.time()
print(start_time)
print(gl.head())
gl.info(memory_usage='deep')
'''

csv_url="C:\\Users\\radhapavan\\Desktop\\PyFiles\\game_logs.csv"
# use chunk size 500
c_size = 5000
'''
from collections import defaultdict
# default value of int is 0 with defaultdict
continent_dict = defaultdict(int)

print(continent_dict)
# load the big file in smaller chunks
for gm_chunk in pd.read_csv(csv_url,chunksize=500):
    print(gm_chunk.dtypes)
'''

px = pd.read_csv(csv_url)
pt = px.loc[:5,["attendance"]]
print(pt.describe())


plt.plot(px)
plt.show()




