: <<aaa
	script administracion cuentas de usuario
			------------------			
			GESTION DE CUENTAS
			------------------

			1. Crear una nueva cuenta
			2. Modificar una cuenta ya existente
			3. Borrar una cuenta ya existente
			4. Cambiar el password a una cuenta existente
			5. --- SALIR ---

en opcion 1 pedir : comentarios, shell , uid , gppal , grupos
en opcion 2 pedir: que modificar y el valor a modificar
en opcion 3 pedir: si quieres borrar o no el directorio personal
en opcion 4 pedir: la pass, reintroducir la pass , las tienes que ver y comprobar que coinciden
y si coinciden cambiarlas ( tienen que coindicir sin usar passwd ) 

aaa
#! /bin/bash

echo -e "\t\tEliga una opcion : "
echo -e "\t\t*******************"
echo -e "\t\t1. Crear una nueva cuenta de usuario. "
echo -e "\t\t2. Modificar una cuenta de usuario ya existente. "
echo -e "\t\t3. Borrar una cuenta de usuario ya existente. "
echo -e "\t\t4. Cambiar la contraseña a una cuenta ya existente. "
echo -e "\t\t5. ******* SALIR ******* "

read opc

case $opc in 
1)
	echo " Introduce el nombre para el nuevo usuario: "
	read nombre
	useradd -c "hola nuevo usuario" -m -u 1991 -g grupito -G otrosGrupitos -s /bin/bash $nombre
	echo " Introduce tu contraseña : "
	read -s passw
	echo $nombre:$passw | chpasswd ;;

2)
	echo " ¿Que cuenta de usuario quieres modificar?: "
	read mod
	echo " ¿Que quieres cambiar?: "
	echo "¿ Desea cambiar los COMENTARIOS? Pulsa n para indicar que no quieres cambios"
	read cambio
	if test $cambio != "n"
	then usermod -c "$cambio" $mod
	fi
 
	echo "¿ Desea cambiar el UID de la cuenta? Pulsa n para indicar que no quieres cambios"
	read uid
	if test $uid != "n"
	then usermod -u $uid $mod
	fi

	echo "¿ Desea cambiar el NOMBRE de la cuenta? Pulsa n para indicar que no quieres cambios"
	read nombre
	if test $nombre != "n"
	then usermod -l $nombre $mod
	fi;;

3)
	echo " ¿ Que usuario desea eliminar?"
	read delete
	echo " ¿ Desea eliminar el directorio personal? Si o No"
	read dp
	if test $dp -eq "si"
	then
	userdel -f -r $delete
	echo "$delete ha sido eliminado junto con su directorio personal."
	else
	userdel -f $delete
	echo "$delete ha sido eliminado. El directorio personal sigue existiendo"
	fi;;

4)
	echo "¿A que usuario quiere cambiar la contraseña?"
	read usuario
	echo "Escriba la nueva contraseña"
	read -s contra
	echo $usuario:$contra | chpasswd
	echo "La contraseña ha sido cambiada correctamente"
	;;

esac






























	

























