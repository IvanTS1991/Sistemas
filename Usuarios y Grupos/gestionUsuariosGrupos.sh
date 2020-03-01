#!/bin/bash
: <<EOF

	PRTACTICA GESTION GRUPOS Y USUARIOS
-----------------------------------
crear un grupo 1DAM ---> gid 5000, password grupo: DAMvesp
 añadir usuarios : damt1, damt2, damt3 (passwords las mismas que los logins,
 grupo ppal 1DAM, secundatio: ALUMNOS)
	administrador del grupo: profeSistemas(password la misma que el login,
						ppal PROFESORES)

crear otro grupo ALUMNOS --> gid 6000, password grupo: ALUMNOSavellaneda
añadir usuarios: damt1, damt2, damt3   (  HACER TODO ESTO COMO ROOT )

1) en una terminal iniciar sesion con: damt1 
(comprobarlo con comando: id) <---- te tiene que salir grupo ppal 1DAM	

  cambiar al grupo ALUMNOS <--- comprobar que estais en grupo ALUMNOS


2) en otra terminal iniciar sesion con: profeSistemas
 (comprobarlo con comado: id) 

  - como eres el administrador del grupo 1DAM, sacar la lista de usuarios del grupo.
  - echar del grupo a damt1 ( ir a consola 1º donde estas con usuario damt1 y ver si puede ingresar al grupo 1DAM de nuevo)
  - te creas un fichero en /tmp <--- llamado: "APUNTES_SISTEMAS.txt"
      miras permisos fichero: ls -l /tmp/APUNTES_SISTEMAS.txt
      te tiene que salir algo asi: -rw-r--r--  profeSistemas PROFESORES APUNTES_SISTEMAS
  - cambiamos el grupo propietario al cihero:
	chown profeSistemas: 1DAM /tmp/APUNTES_SISTEMAS.txt
  - cambiamos permisos al fichero:
	chmod g+w,o-rwx
  - en terminal 1 con usuario "damt1" (no debe pertenecer al grupo 1DAM)
    intenta ver el contenido del fichero /tmp/APUNTES_SISTEMAS.txt ¿ te deja ?

en terminal 1 cambia a usuario "damt2" con su...ahora con este usuario ¿ te deja ?
(si deberia xq pertenece al grupo 1DAM)


3º) en otra terminal como root:
  
  - ver a que grupos pertenece el usuario damt1, damt2, damt3
  - quitar de "administrador" al usuario profeSistemas del grupo 1DAM (vas a terminal
    2 donde estas como "profeSistemas" e intentas sacar del grupo 1DAM al usuario damt2 ¿ te deja ?.
EOF
