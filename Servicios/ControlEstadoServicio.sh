#!/bin/bash
: <<EOF
	script control estado de un servicio
	
	ADMIN SERVICIOS
	---------------
	1.Arrancar un servicio
	2.Parar un servicio
	3.Ver el fichero de configuracion de un servicio
	4.Ver Dependencias de un servicio
	5. --- SALIR ---
EOF
opcion=0
while true
do
	clear
	
	echo -e	"\t\t\t ADMIN SERVICIOS"
	echo -e	"\t\t\t ---------------"
	echo -e	"\t\t\t 1.Arrancar un servicio"
	echo -e	"\t\t\t 2.Parar un servicio"
	echo -e	"\t\t\t 3.Ver el fichero de configuracion de un servicio"
	echo -e	"\t\t\t 4.Ver Dependencias de un servicio"
	echo -e	"\t\t\t 5.Ver Estado de un servicio"
	echo -e	"\t\t\t 6. ---- SALIR -----"


	read -p "Opcion_" opcion
	
	#if test -eq 6; then exit 0; fi
	test $opcion -eq 6 && { echo "...nos vamos..."; exit 0; } #otra manera de hacer un if (manera clasica linea de arriba )
	#exit 0 es el codigo de salida; si es 0 es ok si es mayor que 0 codigo de salida erroneo ALGO SALIO MAL

	read -p "Nombre del servicio..." serv
	case $opcion in 
		1) systemctl start $serv.service 2>/dev/null || echo "...el servicio no existe..." ;;
		2) systemctl stop $serv.service 2>/dev/null || echo "...el servicio no existe..." ;; #|| testea que si lo de la izquierda es 			erroneo salta el error y el 2>/dev/null desactiva el error que muestra el bash
		3) systemctl cat $serv.service 2>/dev/null || echo "...el servicio no existe..." ;;
		4) systemctl list-dependencies $serv.service 2>/dev/null || echo "...el servicio no existe..." ;;
		5) systemctl status $serv.service 2>/dev/null || echo "...el servicio no existe..." ;;
	esac
	read -n 1 -p ".......pulsa una tecla para continuar......" tecla
done













