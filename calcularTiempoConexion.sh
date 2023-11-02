#!bin/bash
#Calcula el tiempo de conexión de un usuario en el sistema
calcularTiempoConexion()
{
	NOMBRES=`cat horas.tmp | cut -f1 -d: | sort | uniq`
	for NOMBRE in $NOMBRES
	do
		USUARIO=`grep $NOMBRE horas.tmp`
		HORAS=0
		MINUTOS=0
		for i in $USUARIO
		do
			HORAS=`echo $i | cut -d: -f2`
			MINUTOS=`echo $i | cut -d: -f3`
			HORAS= `expr $HORAS + $HORAS`
			MINUTOS=`expr ~MINUTOS + $MINUTOS`
		done
		TIEMPO_HORAS=`expr $HORAS + $MINUTOS / 60`
		TIEMPO_MINUTOS=`expr $MINUTOS % 60`
		echo Nombre: NOMBRE - horas: $TIEMPO_HORAS , minutos: $TIEMPO_MINUTOS
	done
}
calcularTiempoConexion