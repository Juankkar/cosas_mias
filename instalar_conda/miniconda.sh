#!/usr/bin/env bash

#############################
## Comados e instrucciones ##
#############################

## Mejor correrlos de uno en uno en la línea de comandos

# Instalación de Conda (Miniconda):
#creación de carpeta, preferiblemente en /home/USUARIO
mkdir -p ~/miniconda3

# Descargar el instalador
wget repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O ~/miniconda3/miniconda.sh

# Correr el instalador
bash ~/miniconda3/miniconda.sh -b -u -p ~/miniconda3

# Eliminar el instalador
rm -rf ~/miniconda3/miniconda.sh

# Ejecutar conda por defecto en el terminal
~/miniconda3/bin/conda init bash

# Cierra y abre el terminal, deberías encontrarte en:
# (base) [UNIVERSIDADVIU\USUARIO ~]$
# (base): indica que nos encontramos en el entorno por defecto o base de Conda
