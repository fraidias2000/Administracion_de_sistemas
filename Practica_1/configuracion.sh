#!/bin/bash

mostrarUsuarios()
{
    echo EJER3
    echo 1. Usuarios conectados y su logname
    echo $(who | cut -d' ' -f1 | sort | uniq)
}
mostrarShell()
{
    echo 2. El shell actual y los shells disponibles
    echo Shell actual:
    echo $SHELL
    echo Shells disponibles:
    more /etc/shells
}
mostrarDirectorio()
{
    echo 3. El directorio home y el PATH actual
    echo Directorio home:
    more $HOME
    echo PATH actual:
    echo $PATH
}

mostrarUsuariosNoConectados()
{
    echo 4. Numero y nombre de usuarios que no estan conectados, pero pertenecen al sistema
    sort /etc/passwd | cut -d: -f1
}
versionSO()
{
    echo 5. Version del sistema operativo
    lsb_release -a
}
configuracionRaton()
{
    echo 6. Configuracion del raton instalado
    cat /proc/devices
}
informacionCPU()
{
    echo 7. Informacion de la CPU
    cat /proc/cpuinfo
}
informacionMemoria()
{
    echo 8. Informacion de la memoria
    cat /proc/meminfo
}
informacionDiscosDuros()
{
    echo 9. Informacion de los diferentes discos duros del sitema
    sudo sfdisk -l
}
mostrarFicherosMontados()
{
    echo 10. Sistema de ficheros montados
    cat /proc/mounts
}


mostrarUsuarios
mostrarShell
mostrarDirectorio
mostrarUsuariosNoConectados
versionSO
configuracionRaton
informacionCPU
informacionMemoria
informacionDiscosDuros
mostrarFicherosMontados

