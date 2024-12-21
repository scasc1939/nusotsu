import numpy as np
from matplotlib import pyplot as plt
from matplotlib import ticker

poly = np.polynomial.Polynomial([12, -10, 9, -10, 12, 9, -10, 2])
x, y = poly.linspace(500, [0, 3])




# 単関数
# ########################################

# y軸の目盛り・グリッド
major_ticks = np.linspace(0, 30, 8+1)
minor_ticks = np.linspace(0, 45, 24+1)

def floor_2(y):
    if y >= 30:
        return 30
    return int(y/(30/8))*(30/8)

def floor_3(y):
    if y >= 45:
        return 45
    return int(y/(45/24))*(45/24)

y_2 = list(map(floor_2, y))
y_3 = list(map(floor_3, y))


# グラフの枠組み
# ########################################

fig = plt.figure()
ax = fig.add_subplot()


# プロット
# ########################################

ax.plot(x, y, '-k')
ax.plot(x, y_2, color='tab:orange', linestyle='-')
ax.plot(x, y_3, color='tab:blue', linestyle='--')
ax.set_ylim(0, 50)


# 目盛りと格子
# ticks and grid
# ########################################
ax.set_xticks([])
ax.set_yticks(major_ticks)
ax.set_yticks(minor_ticks, minor=True)
ax.grid(axis='y', which='major', alpha=1.0)
ax.grid(axis='y', which='minor', alpha=0.2)


# ここの Method III
# https://www.geeksforgeeks.org/how-to-hide-axis-text-ticks-or-tick-labels-in-matplotlib/
ax.yaxis.set_major_locator(ticker.NullLocator())


# グラフを表示
# ########################################

plt.show()
