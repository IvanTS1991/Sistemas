#! /bin/bash
: <<EOF
	para probarlo, una vez lanzado el script, en otra consola cambiar de forma estatica la MAC del router:
	x ejemplo:
			arp -s 192.168.1.1 aa:bb:cc:dd:ee:ff
	
	para volver al estado inicial, borrar esta entrada:
			arp -d 192.168.1.1

	en el script se restablece la MAC original del router xq se ha vuelto a hacer arp-request por broadcast
EOF

while true
do
	clear
	echo -e "....mostrando cache ARP del equipo, OJO con la fila del router para ver si cambia su MAC....\n\n"
	arp -e -n
	sleep 1s
done


#arp -s $(route -n | awk '/^0.0.0.0/ {print $2}')
#$(arp -n | grep route -n | awk '/^0.0.0.0/ {print $2}'| awk '{print $3}')
#arp -s 1.1.1.1 de:ad:be:ef:de:ad
#arp -s
#ip neigh add 192.168.1.100 lladdr 00:5v:54:33:v8:02 dev eth0 nud perm