#!/bin/bash
: <<EOF
	script administracion cuentas de usuario
		GESTION DE CUENTAS
		------------------
	1.Crear nueva cuenta
	2.Modificar cuenta existente
	3.Borrar cuenta existente
	4.Cambiar password cuenta existente
	5. ------------ SALIR --------------
En opcion 1 pedir: comentarios,shell,uid,grupo principal, grupos
En opcion 2 pedir: que quieres modificar y el valor a modificar
En opcion 3 pedir si quieres borrar o no directorio personal
En opcion 4 pedir: te tiene que pedir la password, reintroducir la password
(tienen que coincidir, sin usar passwd)
EOF
