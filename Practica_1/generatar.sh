#!/bin/bash
echo "a. Generación fichero tar"
echo "b. Extracción fichero tar"
echo "c. Visualización de la información del fichero tar"
echo "d. Listado de todos los archivos incluidos en el fichero tar"

configurarFicheroTar()
{
    read -p "Seleccione una opción: " opcion
    case $opcion in
        a) read -p "Introduzca el nombre del archivo a generar: " archivo
           tar -cvf $archivo.tar ./$archivo;;
        b) read -p "Introduzca el nombre del archivo a extraer: " archivo
           tar -xvf $archivo.tar;;
        c) read -p "Introduzca el nombre del archivo a visualizar: " archivo
           stat $archivo;;
        d) read -p "Introduzca el nombre del archivo: " archivo
           tar -tvf $archivo.tar;;
        *) echo "Opción incorrecta";;
    esac
}

configurarFicheroTar
