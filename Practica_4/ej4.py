#!/usr/bin/python
count = 0
multiplos = 0
numero = int(input("Introduce un numero mayor a 1: "))

for rango in range(2, numero+1): 
   if rango % 2 == 0 and rango % 3 == 0:
      count = count + 1
      multiplos = multiplos + rango
      print ("Multiplo de 2 y 3:", rango)

print (" ")
print ("Numeros multiplos de 2 y 3:", count)
print ("La suma de los multiplos de 2 es:", multiplos)



