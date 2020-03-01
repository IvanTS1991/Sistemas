: <<BB
script que compruebe si ese usuario EXISTE en el sistema si no existe, acabar script con mensaje de error
	fichero de usuarios: less /etc/passwd
BB
#! /bin/bash
clear
read -p "Introduce el nombre de un usuario :_" usuario

if grep -qi "^$usuario:" /etc/passwd

then

echo "Existe"
aa
else

echo "No existe"

fi
