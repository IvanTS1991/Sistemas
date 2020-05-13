#! /bin/bash

while true
do
	clear
	echo -e "\n\t\t SOCKETS en estado ESTABLISHED q tienes en este momento"
	echo -e "\t\t ------------------------------------------------------" 
	for i in `netstat -n -t | grep "\(ESTABLECIDO\|ESTABLISHED\)" | tr -s " "  | cut -d " " -f 5`
	do 
		equipo=`echo $i | cut -d ":" -f 1`
		puerto=`echo $i | cut -d ":" -f 2`
		app=`grep -e "$puerto/tcp" /etc/services | cut -f 1`
		echo -e "\t\t equipo remoto: $equipo  ----   puerto remoto: $puerto ---- aplicacion: $app"
	done

	sleep 1s
done

