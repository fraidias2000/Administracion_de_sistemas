#!/bin/bash
VECTOR="0123456789ABCDEFGHIJKLMNÑOPQRSTUVWXYZabcdefghijklmnñopqrstuvwxyz"
crearContrasenia()
{
	#Creamos una contraseña aleatoria de 10 carácteres
	for ((i=0;i<10;i++));do
  		aleatorio=$(echo "$RANDOM")
  		#Módulo 63 porque hay 64 psibilidades en el vector
  		num=$((aleatorio%63))
  		contra+=$(echo ${VECTOR:$num:1})
	done

	cifrada=$(echo "$contraseña"|md5sum)
	aleatorio=$(echo "$RANDOM")
	#caracter por caracter se le aplica la formula caracter = (ASCII+RANDOM)&256
	for((i=0;i<10;i+=1))
	do
    		car=$(echo ${contra:$i:1})
    		car=$(printf "%d" \'"$car")    
    		car=$((car+aleatorio))    
    		car=$((car%256))   
    		car=$(echo "$car"|xxd -p -r)
    		cifradocar+=$(echo "$car")
	done
	echo "Contraseña: $contra"
	echo "Contraseña cifrada con md5: $cifrada"
	echo "Contraseña cifrada caracter a caracter: $cifradocar"
}
crearContrasenia   
