#!/bin/bash
: <<EOF
	script que genera un servicio en systemd que escuche por el puerto 6666   ******** examen *********
	que al conectarte a el te diga :
	
	"Buenos dias, son las ..." ---> fecha y hora del instante en que te conectas
	
	Debe de arrancarse en multiuser.target
EOF

hora=`date +"%T"`

echo "Buenos dias cachopan. Son las $hora" | nc localhost 6666


