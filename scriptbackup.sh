:<<EOF
	pedir nombre del directorio a hacer el backup		******* examen ******
	(comprobar que existe, sino error y salir)
		TIPO BACKUP
		-----------
		1. Total <--------- backupTotal-nombreDir-dd-mm-aaaa-hh-mm.tar.gz
		2. Incremental <-- backuoIncremental-Nº-nombreDir-dd-mm-aaaa-hh-mm.tar.gz
		3. -- SALIR --
hay que comprobar  que si intentas hacer un backup incremental de un directorio existe ya un backup total
del mismo. Si no mensaje de error indicandoselo
	
EOF

opcion=0
	while test $opcion -ne 3
	do
		
		echo -e "\t\tTIPO BACKUP"
		echo -e "\t\t-----------"
		echo -e "\t\t1.Backup Total"
		echo -e "\t\t2.Backup Incremental"
		echo -e "\t\t3.SALIR"
		read -p "opcion:" opcion
		case $opcion in
			1|2) read -p "Introduce directorio del que quieres BACKUP: " directorio
			     fecha=`date +%a-%b-%e-%H-%M-%S`
			     nombre=backupTotally #$directorio
			     nom=backupIncrementally #-$directorio	
		 	     test -d $directorio || { echo "no existe...."; exit 0;}
				if test $opcion -eq 1
				then 
					#backup total
					tar -v -z -c -f /tmp/$nombre`date +%a-%b-%e-%H-%M-%S`.tar.gz /home/alumnot/Imágenes
				else
				ls /tmp
				echo "-------------------------------"
				test -f /tmp/$nombre.tar.gz || { echo "no existe backup previo...."; exit 0;}
					#backup incremental
					tar -v -z -c -f /tmp/$nom`date +%a-%b-%e-%H-%M-%S`.tar.gz $directorio
				fi
				;;

			3) 	
				exit 0
				;;
			
		esac
		sleep 10
	done
