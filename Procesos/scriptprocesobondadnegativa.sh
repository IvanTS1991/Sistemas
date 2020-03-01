: <<dd
	lanzar la calculadora (gnome-calculator) con bondad positiva (baja 		prioridad): -1 a -19
	
	ponerlo en background nada mas lanzarlo
	comprobar con jobs
	pasarlo a primer plano con fg
	pararlo con ctr+Z
	comprobar con jobs que esta detenido
	volver a lanzar su ejecucion en segundo plano con bg
	volverlo a pasar a primer plano con fg
	parar el proceso con ctrl+C
	comprobar que no existe con jobs
dd
#! /bin/bash

	nice -n 10 gnome-calendar &
	jobs
		[1] Ejecutando nice -n 10 gnome-calendar &
	fg %1
	pulsamos control+Z ---> te muestra [1]+ Detenido
	jobs ----> sale:
		[1]+ Detenido    nice -n 10 gnome-calednar
	bg %1
	fg %1
	pulsamos Control+Z
	jobs
	
