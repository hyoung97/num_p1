import sys
import math

def f(x):
	return math.exp(-x/5.0)-math.sin(x)

def bisection(a,b,tol):
	xl = a
	xr = b 
	c =0
	n=0
	while (xr-xl) >= tol:
		c = (xl + xr)/2.0
		prod = f(xl)*f(c)
		n+=1
		if prod>tol:
			xl=c;
			
			
		else: 
			if prod < tol:
				 xr = c;
				 
		

	return c,n

c,n = bisection(0,1.5,1e-7)
y,z = bisection(2,4,1e-7)
x,w = bisection(6,7,1e-7)
u,v = bisection(9,10,1e-7)
print("Bisection on Interval 0-1.5: ", c, "iters: ", n)
print("Bisection on Interval 2 - 4: ", y, "iters: ", z)
print("Bisection on Interval 6 - 7: ", x, "iters: ", w)
print("Bisection on Interval 9 - 10: ", u, "iters: ", v)
