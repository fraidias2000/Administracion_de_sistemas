#!/usr/bin/python
count = 0
pares = 0
uno = 1
numero1 = int(input("Introduce el primer numero: "))
numero2 = int(input("Introduce el segundo numero: "))

for numeros in range(numero1, numero2+1):
   print (numeros)
   if numeros % 2 == 0:
      count = count + 1
      pares = pares + numeros

print ("Hay", count, "numeros pares")
print ("La suma de los pares es:", pares)
