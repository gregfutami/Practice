from sys import argv
from decimal import *
import math

getcontext().prec = 100

script, size_string = argv

size = int(size_string)

print "size: %d" % size

i = Decimal(0)

pi_sum = Decimal(0)

while i < size:
	numer = Decimal((math.factorial(6*i)*(13591409 + 545140134*i)))
	denom = Decimal((math.factorial(3*i)*math.pow(math.factorial(i),3)*math.pow(-640320,(3*i))))

	pi_sum += Decimal(numer/denom)
	i+=1



value = Decimal(Decimal((12/math.pow(640320,1.5)))*pi_sum)

pi = Decimal(1/value)

print ("PI: {0}".format(pi))



# 	python pi2.py 2





