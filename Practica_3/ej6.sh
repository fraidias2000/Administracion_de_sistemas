#/bin/bash

getNum(){
	correcto=0
	num=0

	while [ $correcto -eq 0 ]
	do
		read -p "$1" num
		if [ $num -ge $2 ]
		then
			correcto=1
		else
			echo "Cantidad erronea..."
		fi
	done
	return "$num"
}

#---------------------------------------------------Funciones de Temperatura---------------------------------------------------
mediaTemp(){
	suma=0
	media=0
	for ((i=0;i<=$numTemperaturas;i+=1))
	do
		suma=$(( $suma + ${temperaturas[$i]} ))
	done
	numTemp=$(($numTemperaturas + 1))
	media=$(($suma / $numTemp))
	return "$media"
}

amplitudTemp(){
	mayor=${temperaturas[0]}
	menor=${temperaturas[0]}
	for ((i=0;i<=$numTemperaturas;i+=1))
	do
		if [ ${temperaturas[$i]} -gt $mayor ]
		then
			mayor=${temperaturas[$i]}
		elif [ ${temperaturas[$i]} -lt $menor ]
		then
			menor=${temperaturas[$i]}
		fi
	done
	echo "Amplitud [ $menor - $mayor ]"
}

#---------------------------------------------------Funciones de Precipitaciones---------------------------------------------------
diasConPrecipitaciones(){
	cont=0
	for ((i=0;i<=numPrecipitaciones;i+=1))
	do
		if [ ${precipitaciones[i]} -gt 0 ]
		then
			cont=$(( $cont + 1 )) 			
		fi
	done
	return "$cont"
}

mediaPrec(){
	suma=0
	media=0
	for ((i=0;i<=$numPrecipitaciones;i+=1))
	do
		suma=$(( $suma + ${precipitaciones[$i]} ))
	done
	numPrep=$(($numPrecipitaciones + 1))
	media=$(($suma / $numPrep))
	return "$media"
}

numMaxPrec(){
	mayor=${precipitaciones[0]}
	num=0
	echo $numPrecipitaciones
	for ((i=0;i<=$numPrecipitaciones;i+=1))
	do
		if [ ${precipitaciones[$i]} -gt $mayor ]
		then
			mayor=${precipitaciones[$i]}
		fi
	done

	for ((l=0;l<=$numPrecipitaciones;l+=1))
	do
		if [ ${precipitaciones[$l]} -eq $mayor ]
		then
			num=$(($num + 1))
		fi
	done
	return "$num"
}


#---------------------------------------------------Obtener Datos---------------------------------------------------

#numTemperaturas=$(getNum "Numero de Temperaturas")
#numPrecipitaciones=$(getNum "Numero de Precipitaciones")

numTemperaturas=0
numPrecipitaciones=0

declare -a temperaturas
declare -a precipitaciones

getNum "Numero de Temperaturas: " 1
numTemperaturas=$?

getNum "Numero de Precipitaciones: " 1
numPrecipitaciones=$?

numTemperaturas=$(( $numTemperaturas - 1 )) 	
numPrecipitaciones=$(( $numPrecipitaciones - 1 )) 	


for ((i=0;i<=$numTemperaturas;i+=1))
do
	#Problemas si intentamos poner -260 como valor minimo, ya que return solo retorna int
	getNum "Temperatura del día $i:  " 0
	temperaturas[$i]=$?
done

echo ${temperaturas[*]}

for ((l=0;l<=$numPrecipitaciones;l+=1))
do
	getNum "Precipitacion del día $l:  " 0
	precipitaciones[$l]=$?
done

echo ${precipitaciones[*]}


#---------------------------------------------------Calcular Valores---------------------------------------------------
mediaT=0
mediaTemp
mediaT=$?
echo "La temperatura media es de $mediaT"

echo "La amplitud termica es $(amplitudTemp)"

dias=0
diasConPrecipitaciones
dias=$?
echo "El numero de dias con alguna precipitacion son $dias"

mediaP=0
mediaPrec
mediaP=$?
echo "Las precipitaciones medias son de $mediaP"

numMaxP=0
numMaxPrec
numMaxP=$?
echo "La cantidad de dias con precipitaciones maximas son: $numMaxP"





