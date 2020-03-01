# este script debe ser un script de DASH /bin/sh (una version reducida de la bash) para poder luego grabarse en /etc/init.d para controlar el servicio q lanza
# esta shell no admite comandos avanzados de bash, como los comentraios en bloque, etc...ademas segun las paginas de manual, man sh, los comandos for,if,case deben
# comenzar al ppo de cada linea
#
# una vez copiado en /etc/init.d  hay q crear un enlace en el directorio del RUNLEVEL 5 con nombre SnumNombre_servicio:
#		  ln -s /etc/init.d/controlServicioECHO.sh  /etc/rc5.d/S99servicioECHO

#!/bin/sh
case "$1" in
"start")
		/usr/bin/ServicioECHO.sh &
		pid=`pgrep -af "nc .* 7777$" | cut -d " " -f 1`
		echo $pid > /var/run/servicioECHO.pid
		echo "------------------------------------------------"
		echo "el servicio ECHO se esta ejecutando con pid: $pid"
		echo "------------------------------------------------"
		;;

"stop")
		if [ -e /var/run/servicioECHO.pid ]
		then
			kill -s SIGTERM  `cat /var/run/servicioECHO.pid`
			rm -ef /var/run/servicioECHO.pid 2>/dev/null
		fi
		echo "...servicio parado, no esta ejecutandose..."
		;;

"status")
		if [ -e /var/run/servicioECHO.pid ]
		then
			echo "el servicio se esta ejecutando con pid: `cat /var/run/servicioECHO.pid`"
		else
			echo "...servicio parado, no esta ejecutandose..."
		fi
		;;

*)
		echo -e "\t\t usalo asi: $0 start|stop|status"
		;;
esac

