: <<ee
	script que te pida:

 	-el nombre de la aplicacion a cambiar la prioridad
	-el valor de la bondad (comprobar que este entre -19 y 20)
	-si quieres ejecutarla desde el principio con esa bondad o si esta ya ejecutandose cambiarsela:

		1. Lanzar con esa bondad
		2. Cambiar la bondad del proceso en ejecucion
		opcion_

ee
#! /bin/bash
clear
read -p "introduce el nombre de una aplicacion: " app
read -p "valor de la bondad( de -19 a 20): " bondad

#----------- aqui condicional if para comprobar valor $bondad ------------
if test $bondad -lt -19 -o $bondad -gt 20
then
	echo "valor de la bondad invalido, entre -19 y 20"
	exit 0
fi
#-------------------------------------------------------------------------
cat <<kk
	1. Lanzarla con esa bondad
	2. Cambiar la bondad del proceso en ejecucion
kk
read -p "opcion: " opcion
#----------- aqui condicional if para comprobar valor $opcion ------------
if test $opcion -eq 1
then
	echo -e "\n\n\t...lanzando la app: $app con bondad: $bondad"
	nice -n $bondad $app
	ps -o pid,ppid,pri,ni,status,cmd -C $app
elif test $opcion -eq 2
then
	echo -e "\n\n\t...cambiando bondad a la app: $app con $bondad"
	renice -n $bondad -p `pidof $app`
	ps -o pid,ppid,pri,ni,status,cmd -C $app
else
	echo "opcion incorrecta!!"
fi
	
#-------------------------------------------------------------------------




