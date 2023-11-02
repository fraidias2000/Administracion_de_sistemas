#!/usr/bin/python
minrange=1
maxrange=100
contador=0

for x in range(minrange,maxrange+1):
    if (x%3) == 0 :
        contador+=1
        print ("%d" % x)
print ("Hay %d numeros entre %d y el %d" % (contador , minrange , maxrange))
