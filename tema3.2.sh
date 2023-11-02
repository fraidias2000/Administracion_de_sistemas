#!/bin/bash
#Comprobamos que el usuario ha insertado unicamente dos parametros
if [ $# -ne 2 ]
then
    echo Numero de parametros incorrecto,solo se permiten 2 parametros.
    exit 0
fi

#Comprobamos que el primer parametro sea "-d"
if [ $1 != "-d" ] 
then
    echo Error, el primer parametro debe ser obligatoriamente -d
    exit 1
fi

#Comprobamos que el segundo parametro sea un numero, mediante una expresión regular
Numero='-?[0-9]+([.][0-9]+)?$'
if ! [[ $2 =~ $Numero ]]
then
    echo Error, el segundo parametro debe ser obligatoriamente un numero
    exit 2
fi

correos=$(ls /var/mail)
#Comprobamos si existe una cuenta de correo vigente
if [ ! $correos ]
then
    echo No existen cuentas de correo vigentes
    exit 3
fi

#Comprobamos si hay un usuario dado de baja en el sistema y tenga el correo vigente
for correo in $correos
do  
    usuario=$(cat /etc/passwd|cut -d ":" -f1|grep $mail)
    if [ ! $usuario ]
    then
        echo El usuario $correo no se encuentra en el sistema, pero tiene el correo vigente
    fi 
done

#Comprobamos el número de días que los usuarios no leen su correo (o sea, 
número de días que el fichero asociado al usuario en /var/mail no ha sido modificado)

dias=$(find /var/mail -mtime +$2)
echo $dias




