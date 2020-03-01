#!/bin/bash
: <<EOF
	crear una nueva cuenta llamada: practica
	comentario: "cuenta de practicas de sistemas"
	uid: 9999
	grupo principal: adm
	grupo secundarios: users,sudo
	shell: /bin/bash
	password: 123456AbC 

	- comprobar que existe en /etc/passwd
	- comprobar que existe el hash en /etc/shadow
	- iniciar sesion con la cuenta en otro terminal
EOF
useradd prueba -c "cuenta de practicas de sistemas" -d /etc/shadow -g adm -G users,sudo -s /bin/bash -u 9999
