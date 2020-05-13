!# /bin/bash
: <<AA
		sacar el numero MAC de la tarjeta
AA


clear
mac=`ifconfig enp0s3 | grep "ether" | tr -s " " | cut -d " " -f 3`
echo -e "\n\n\t la direccion MAC de la tarjeta es : $mac"

idfabricante=`echo $mac | cut -d ":" -f 1,2,3`
idtarjeta=`echo $mac | cut -d ":" -f 4,5,6`

echo -e "\t\t el id del fabricante es : .... $idfabricante"
echo -e "\t\t el id de la tarjeta es : .... $idtarjeta"

#root@edhost:~# ip link show enp0s3 | grep "ether" | tr -s " " | cut -d " " -f 3 
#08:00:27:be:43:cd  ----> mismo comando que ifconfig ( ifconfig obsoleto )
