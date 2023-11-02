#!/bin/bash
#Muestra la información del proceso pasado como parámetro
mostrarInfoProceso()
{
    proceso=$1
    ps -l|tr -s ' ' |grep ^$proceso|cut -d " " -f 3,4,5,6,7,9
}

mostrarInfoProceso
