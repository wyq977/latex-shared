import numpy as np
from scipy.stats import norm
import matplotlib.pyplot as plt
from matplotlib import rcParams
from matplotlib.ticker import MaxNLocator

WIDTH_IN = 2.8
HEIGHT_IN = 2.1

x = np.linspace(-20, 20, 1000)

y = norm.pdf(x)

fig, ax = plt.subplots(figsize=(WIDTH_IN, HEIGHT_IN))

ax.plot(x, y, label=r'$\mathcal{N}(0, 1)$', linewidth=1, color='red')

ax.plot(x, norm.pdf(x, loc=0, scale=4), label=r'$\mathcal{N}(0, 4)$', linewidth=1, color='blue')

ax.set_xlabel('Python and LaTeX: $x$')
ax.set_ylabel('Python and LaTeX: $y$')
ax.set_ylim(bottom=np.max(y) * -0.05, top=np.max(y) * 1.05) 
ax.xaxis.set_major_locator(MaxNLocator(5))
ax.yaxis.set_major_locator(MaxNLocator(5))
ax.legend() 

plt.tight_layout(pad=0.1)
plt.savefig("scatterplot-python.pdf", format='pdf') 