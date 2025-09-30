import numpy as np
from scipy.stats import norm
import matplotlib.pyplot as plt
from matplotlib import rcParams

# rcParams.update({
#     "text.usetex": False
# })

WIDTH_IN = 2.8
HEIGHT_IN = 2.1

x = np.linspace(-20, 20, 1000)

y = norm.pdf(x)

fig, ax = plt.subplots(figsize=(WIDTH_IN, HEIGHT_IN))

ax.plot(x, y, label=f'Prior', linewidth=1)

# ax.set_title('Normal distribution $\\mathcal{N}(0,1)$')
ax.set_xlabel('$x$')
ax.set_ylabel('$y$')
ax.set_ylim(bottom=np.max(y) * -0.05, top=np.max(y) * 1.05) 

plt.tight_layout(pad=0)
plt.savefig("scatterplot-python.pdf", format='pdf') 