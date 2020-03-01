:<<EOF
	script control de mi primer servicio...
EOF
#!/bin/bash

while true
do
	case "$1" in
		"start")
		#...lanzo servicio con parametros
 		# $0 = nombre del script del serv.		
			/etc/init.d/$0
			;;
		"stop")
			#...paro el servicio....
			## el pid del script del servicio
			kill -s SIGSTOP $$
			;;
		"status")
			if pidof $0
			then
				echo "servicio ejecutandose"
			else
				echo "servicio parado"
			fi
			;;

		*)
		   echo "uso: $0 start|stop|status"
		   ;;
	esac
done


