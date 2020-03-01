: <<cc
	script que te pida el nombre del proceso al que quieres mandar una señal, despues te muestra:
	     señal a mandar...
		1- SIGSTOP
		2- SIGKILL
		3- SIGTERM
		4- SIGUP
			opcion_
	debes mandar la señal seleccionada al proceso 
cc
#! /bin/bash
clear
read -p "Introduce nombre proceso a mandar señal:_" proceso
echo " 
	---------------------
	  señal a mandar...
	---------------------
		1- SIGSTOP
		2- SIGKILL
		3- SIGTERM
		4- SIGUP
"
read -p "introduce numero de opcion de señal a mandar:_" signal
case $signal in
	1) echo "Has seleccionado SIGSTOP"
		kill -SIGSTOP $proceso
		;;
	2) echo "Has seleccionado SIGKILL"
		kill -SIGKILL $proceso
		;;
	3) echo "Has seleccionado SIGTERM"
		kill -SIGTERM $proceso	
		;;
	4) echo "Has seleccionado SIGUP"
		kill -SIGUP $proceso
		;;
	*)
		echo -e "\n\n\t OPCION INVALIDA!!"
		exit 0;
esac
