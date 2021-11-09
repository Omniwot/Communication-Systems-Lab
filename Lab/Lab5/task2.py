from scipy import special
import numpy as np
import matplotlib.pyplot as plt
import numpy as np
import matplotlib.pyplot as plt



sigma = 8
mu = 0
x = sigma*np.random.randn(10000) + mu
plt.hist(x)
plt.show()
sigma = 8
mu = 0
iter_max=100000
count=0
for iter in range(iter_max):
    nt = sigma*np.random.randn(1) + mu
    if nt>sigma:
      count+=1
Prob= count/iter_max
average_prob=print(Prob)

qfunc_prob=0.5 - 0.5*special.erf(1/np.sqrt(2))
theoretical_prob=print(qfunc_prob)
import numpy as np
import matplotlib.pyplot as plt
sigma = 8
mu = 0
nt = sigma*np.random.randn(1000) + mu
ac=np.correlate(nt, nt, mode = 'full')
#print(ac)
plt.figure(2)
plt. plot(ac)
plt.show()