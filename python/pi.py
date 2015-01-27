
# compute pi
from sys import argv

import math

script, size_string = argv

i = 0
j = 0

#value = math.pow(401,2) + math.pow(301,2)
#value2 = math.sqrt(value)

#print "value of 401^2 + 301^2= %d" %value
#print "value of sqrt(401^2 + 301^2)= %f" %value2

size = int(size_string)

print "size: %d" % size

points_in = 0

while i < size:
	j=0
	while j < size:
		if (math.sqrt(math.pow(i,2) + math.pow(j,2)) < size):
			points_in += 1

		j+=1
	i+=1

pi = 4 * points_in / math.pow(size,2)

print "points in: %d" % points_in

print "PI: %f" % pi

# 	python pi.py 1000
# 	python pi.py 2000

# 	python pi.py 10000

