#!/bin/bash
#------------- definicion de funciones ----------------------------
function menu() {
        clear
        echo -e "\t\t MANEJO CACHE ARP EQUIPO LOCAL"
        echo -e "\t\t -----------------------------"
        echo -e "\t\t 1. Mostrar la cache ARP del equipo"
        echo -e "\t\t 2. Buscar una MAC"
        echo -e "\t\t 3. Borrar una entrada de la cache"
        echo -e "\t\t 4. Añadir una entrada ESTATICA a la cache"
        echo -e "\t\t 5. --SALIR--"
        read -p "opcion:_" opcion
}

function mostrarARP(){
        echo -e "\n\t\t ...mostrando cache del equipo....\n\n"
        arp -e -n
}

function buscarMAC(){
        read -p "introduce la IP del que quieras saber la MAC..." mip
        # lo suyo seria comprobar o validar el formato de esa variable (4 digitos separados por puntos, como una ip)

        #...buscar esa ip en la cache arp, con grep y la MAC estaria en la 3 columna....
        mac=arp -e -n | grep "^$mip" | tr -s " " | cut -d " " -f 3
        echo -e "\n\t ...la direccion MAC para esa ip es: $mac"
	#DEBES DE PONER "LOCAL" PARA QUE INA VARIABLE SOLO SEA DE LA FUNCTION SI NO SERA GENERAL
}

function addMAC(){
	echo -e "\n\t\t ...añadiendo una entrada ESTATICA a la cache....\n\n"
	echo -p "\n\n\t introduce la entrada en formato XXX.XXX.X.X aa:bb:cc:dd:ee:ff...\n\n" entrada
	arp -s $entrada
	
}
#-------------------------------------------------------------------
#-------------- MAIN -----------------------------------------------

opcion=0
while test $opcion -ne 5
do
        menu
        case $opcion in
                1) mostrarARP;;
                2) buscarMAC;;
                3) BorrarMAC;;
                4) AddMAC;;
        esac
        sleep 5s
done
