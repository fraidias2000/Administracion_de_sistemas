#!/usr/bin/python
pares = 0
impares = 0
rango= 100

for numero in range(1, rango+1):
	numactual=rango-numero
	if numactual % 2 == 0:
		pares = pares + numactual
	else:
		impares = impares + numactual
		print ("%d" % numactual)
print ("La suma de los pares es:", pares)
print ("La suma de los impares es:", impares)
