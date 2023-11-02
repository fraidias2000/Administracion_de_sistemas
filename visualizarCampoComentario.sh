#!bin/bash
visualizarCampoComentario()
{
	echo "Dime el login del usuario que quieres saber su campo de comentario: "
	read usuarioLogin
	campo_comentario=$(cat /etc/passwd|grep ^$usuarioLogin|cut -d":" -f5)
	if [ "$campo_comentario" ]
	then 
   		 echo "Los datos del usuario son:" $campo_comentario
	else
    		echo "Dicho usuario no existe en el sistema"
	fi
}

visualizarCampoComentario