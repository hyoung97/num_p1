import sys
import math

def f(x):
        return math.exp(-1.0*x/5.0)-math.sin(x)
def dx(x):
        return (-1.0/5.0)*math.exp(-1.0*x/5.0)-math.cos(x)

def newtons(a,tol):
	guess =a
	c=0
	n=0
	
	while f(guess) > tol:
	        n+=1
	        guess = guess - (f(guess)/dx(guess)) 
        return guess, n

c,n = newtons(1,1e-7)
y,z = newtons(2,1e-7)
x,w = newtons(7,1e-7)
u,v = newtons(9,1e-7)
print("Newton's on guess = 1: ", c, "iters: ", n)
print("Newton's on guess = 2: ", y, "iters: ", z)
print("Newton's on guess = 7: ", x, "iters: ", w)
print("Newton's on guess = 9: ", u, "iters: ", v)
