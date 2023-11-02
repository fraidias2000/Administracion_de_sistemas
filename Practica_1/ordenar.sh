#!/bin/bash
function burbuja {
    lista=$1
    tam=${#lista[@]}

    for i in $(seq 1 $[$tam-1]); do
    for j in $(seq 0 $[$tam - $i - 1]); do
        if [ ${lista[$j]} -gt ${lista[$j+1]} ]; then
                k=${lista[$[$j+1]]}
                lista[$j+1]=${lista[$j]}
                lista[$j]=$k
        fi
    done
    done
}
lista=($*)
echo "La secuencia introducida es: $*"
burbuja $lista
echo "La secuencia ordenada es:"
for i in ${lista[@]}; do
    echo $i;
done
