#!/bin/bash
#Comprobamos que el usuario haya introducido 3 parámetros
comprobarTresParametros()
{
   if ! [ "$#"=3 ]
   then
      echo "Numero de parametros incorrecto"
      exit 0
   fi
}
comprobarTresParametros

#Comprobamos que el login del usuario está comprendido entre 3 y 8 caracteres y comprobamos que sólo contenga letras minúsculas
login=$1
longitud=${#login}
if [ $longitud -lt 3 ] || [ $longitud -gt 8 ]
then
   echo "Login incorrecto: el login deberá tener entre 3 y 8 caracteres"
   exit 1
else
    sudo useradd -d /HOME -s /bin/bash $login
fi


#Comprobamos si el tercer parámetro es contabilidad,finanzas o estadísitca
grupo=$3
if [ "$grupo" = contabilidad ] || [ "$grupo" = finanzas ] || [ "$grupo" = estadistica ] 
then
   echo "Grupo correcto"
else
    echo "Grupo incorrecto: el grupo tiene que ser contabilidad, finanzas, estadística"
    exit 2
fi

#Comprobamos si el grupo seleccionado ya existe
columnaGrupo=$(cut -d ":" -f1 /etc/group|grep "$grupo")
if [ "$columnaGrupo" ]
then
    usermod -g $grupo $login
else
#Creamos el grupo y se lo asignamos al usuario creado anteriormente
    groupadd -r $grupo  
    usermod -g $grupo $login
fi








    



