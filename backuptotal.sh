: <<EOF
	script guarripei que hace backup total
	guardarlo en nano /tmp/crontab
	dar permisos con chmod ugo+x _nombre_script.sh
EOF
#!/bin/bash

tar -v -z -c -g /tmp/ficheroApoyo -f /tmp/backupCompletoImagenes.tar.gz /home/alumnot/Imágenes
