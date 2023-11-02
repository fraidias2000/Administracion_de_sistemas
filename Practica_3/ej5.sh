#/bin/bash

if [ -d $1 ]
then
	#if [ $($PATH | grep -c $1) -gt0 ]
	if [  -d $1 ]
	then
		echo "El directorio se encuentra en PATH"
	else
		echo "El directorio no se encuentra en PATH"
	fi
else
	echo "El directorio no existe"
fi