: <<AA
script que te pida el nombre de un usuario
	mostrar de los procesos de ese usuario estas opciones:
		-pid
		-ppid
		-prioridad
		-bondad
		-estado del proceso
		-uso de memoria
		-uso de cpu
		-tiempo de ejecucion
		-comando
AA
#! /bin/bash
clear
echo -e "\n\n\t\t VAMOS A MOSTRAR LA INFO DEl USUARIO:"
echo -e "\t\t----------------------------------------------"
read -p "Introduce un usuario: " usuario
ps -l -H -u pid,ppid,uid,status,%cpu $usuario
