: <<EOF
	script crea un servicio ECHO segun antiguo init....
	usa una PIPE para recibir mensajes de clientes y volver a mandarlos
	hay q copiarlo en: /usr/bin
EOF
#!/bin/bash

if [ -p /tmp/mitub ]
then
	mkfifo /tmp/mitub
	chmod 7777
 /tmp/mitub
fi
cat /tmp/mitub | nc -l -k localhost -p 7777 > /tmp/mitub


