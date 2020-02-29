: <<EOF
	script guarripei que hace backup incremental
	guardarlo en nano /tmp/crontab
	dar permisos con chmod ugo+x _nombre_script.sh
EOF
#!/bin/bash

tar -v -z -c -g /tmp/ficheroApoyo -f /tmp/backupIncrementImagenes.tar.gz /home/alumnot/Imágenes 
