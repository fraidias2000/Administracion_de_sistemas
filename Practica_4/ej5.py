#!/usr/bin/python
A=int(input("Introduzca el valor A: "))
B=int(input("Introduzca el valor B: "))
C=int(input("Introduzca el valor C: "))
resultado=0
rango=30

if (A/B) > rango:
    resultado=A/C*B**3
else:
    for x in range(2,rango+1):
        if (x%2)== 0 :
            resultado=resultado+x**2
			
print ("El resultado total es:", resultado)
