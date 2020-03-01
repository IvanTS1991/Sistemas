:<<cc
Crear un grupo 1DAM ---> gid 5000, password grupo: DAMvesp
 añadir usuarios: damt1, damt2, damt3 (passwords las mismas que los logins, 
				grupo ppal 1DAM, secundario: ALUMNOS).

 administrador del grupo: profeSistemas (password la misma que el login, grupo ppal PROFESORES). 
cc
#! /bin/bash

echo -e "\t\tMenu para configuracion de usuarios y grupos"
echo -e "\t\t********************************************"
echo -e "\t\tEscoja una opcion"
echo -e "\t\t1. Crear un nuevo grupo"
echo -e "\t\t2. Crear nuevos usuarios"
echo -e "\t\t3. Modificar grupos"
echo -e "\t\t4. Configurar usuarios"
echo -e "\t\t5. Eliminar usuarios"

read -p "opcion " opc
case $opc in


# --------> CREAR NUEVO GRUPO <--------
1)
	echo "Indica el nombre del nuevo grupo: "
	read grupo
	echo "Cual sera tu GID?"
	read gid
	groupadd -g $gid $grupo
	gpasswd $grupo
	echo "El grupo ha sido creado correctamente"
	tail -n3 /etc/group ;;


# --------> CREAR NUEVO USUARIO <--------
2)

	echo "¿Cuantos usuarios quieres crear?"
	read users
	echo "Introduce un nombre"
	read usuario
	echo "¿A que grupo principal quieres que pertenezca?"
	read grupo
	echo "¿A que grupo secundario quieres que pertenezca?"
	read gruposec
	echo "Introduzca una contraseña"
	read npass


	for (( i=0; i < $users; i++ ))
	do 
	useradd -u 500$i -g $grupo -G $gruposec $usuario$i
	echo $usuario$i:$npass$i | chpasswd
	done ;;


# --------> CONFIGURACION DE GRUPOS <--------
3)

	echo "Elige una opcion: "
	echo "1. Borrar grupo"
	echo "2. Adjudicar nuevo administrador para un grupo"
	echo "3. Agregar un nuevo administrador al grupo"
	echo "4. Cambiar la contraseña del grupo"

	read -p "Option: " opcgrp
	case $opcgrp in 

1)
	echo "Indique el nombre del grupo"
	read nombregrp
	groupdel $nombregrp
	echo "El grupo ha sido borrado correctamente" ;;

2)
	echo "Indique el nombre del grupo"
	read admingroup
	echo "Escriba un nombre para su nuevo administrador"
	read adminame
	useradd -c "$adminame" -m -u 4999 -g $admingroup  -s /bin/bash $adminame
	echo "Escriba la contraseña"
	read -s pass
	echo $adminame:$pass | chpasswd 
	gpasswd -A $adminame $admingroup
	echo "El usuario $adminame se ha agregado como administrador del grupo $admingroup"
		;;


3)
	echo "Indique que usuario sera administrador:"
	read adminusu
	echo "Indique el nombre del grupo"
	read grupoadmin
	gpasswd -A $adminusu $grupoadmin
	echo "Se realizo correctamente"
		;;
		

4)
	echo "Indique el nombre del grupo"
	read passgroup
	gpasswd $passgroup

	
esac ;;

# --------> CONFIGURACION DE USUARIOS <--------

4)
	echo "¿Que usuario quieres configurar?"
	read cambusu
	echo "Indica los cambios que quieres hacer"
	echo "¿Cambiar los comentarios? Pulsa n para salir sin hacer cambios"
	read comen
	if test $comen != "n"
	then userdmod -c "$comen" $cambusu
	fi
	echo "¿Cambiar el UID? Pulsa n para salir sin hacer cambios"
	read uid
	if test $uid != "n"
	then usermod -u $uid $cambusu
	fi

	echo "¿Cambiar el nombre de usuario? Pulsa n para salir sin hacer cambios"
	read newuser
	if test $new != "n"
	then usermod -l $newuser $cambusu
	fi;;


# --------> ELIMINAR USUARIOS <--------
5)
  echo "Eligue una opcion"
  echo "1. Eliminar usuario"
  echo "2. Cambio de contraseña"
  read -p "Opcion: " cu

case $cu in 
1) 
	echo "¿ Que usuario quieres eliminar?"
	read delusr
	echo "¿ Quieres eliminar el directorio personal ?(si o no)"
	read sn
	if test $sn -eq "si"
	then
	userdel -f -r $delusr
	echo "$delusr ha sido eliminado junto con sus directorios personales"
	else
	userdel -f $delusr
	echo "$delusr ha sido eliminado sin directorios personales"
	fi;;

2)
	echo "Indique un usuario para establecer nueva contraseña"
	read usr
	echo "Escriba la contraseña"
	read -s newpass
	echo $usr:$newpass | chpasswd 
	echo "La contraseña ha cambiado correctamente"
	;;

	esac ;;

esac



