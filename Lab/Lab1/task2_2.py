from matplotlib import pyplot as plt
import numpy as np
amplitude=[]
t = np.arange(0,1,0.01)
print(t)
for i in t:
    print(i)
    amplitude.append(np.sin(2*np.pi*350*i)+np.sin(2*np.pi*650*i))
print(amplitude)
plt.figure()
plt.plot(t, amplitude)
plt.xlabel("time")
plt.ylabel("amplitude")
plt.ylim([-1, 1])
plt.xlim([0, 1])
plt.show()