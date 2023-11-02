#!/bin/bash
#Función que aumenta la prioridad relativa del proceso pasado si su prioridad es mayor de 10
prioridad()
{
    PID=($(ps -l|awk '$8 > 10 && $4 {print $4}'))
    NI=($(ps -l|awk '$8 > 10 && $4 {print $8}'))
    longitud=${#PID[@]}
    if [[ $longitud = 1 ]]
    then
        echo "No se han encontrado procesos con una prioridad relativa superior a 10"
    else
        for ((i = 1;i <$tam;i++)) do
            NI[$i]=$((${lista[$i]} + 5))
            renice -n ${NI[$i]} -p ${PID[$i]}
        done
    fi
}
prioridad
