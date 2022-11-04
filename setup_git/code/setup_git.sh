#!/usr/bin/env bash

#### Comandos para establecer nuestra cuenta, y poder interactuar con GitHub y nuestro ordenador local.
#### Recomiendo encontrarse en su usuario home idealmente, por si acaso. Aunque no creo que sea 
# estrictamente necesario por lo que he repasado en cuanto al código.
echo ">>> Rellene los siguientes apartados"
read -p "Inserte su numbre: " nombre
read -p "Inserte su correo electrónico: " correo
read -p "Inserte su usuario de Github: " usuario
read -p "Inserte input (Mac/Linux) o true (Windows): " autocrlf
read -p "inserte su editor de texto principal: " editor

# Añadimos nuestro NOMBRE
git config --global user.name $nombre 
# Añadimos nuestro GMAIL
git config --global user.email $correo
# Añadimos nuestra cuenta de GitHub 
git config --global github.user $usuario
# Cómo git maneja tus lineendings
git config --global core.autocrlf $autocrlf
# Elegir el editor de texto, usaré vim en este caso
git config --global core.editor $editor
# Podemos usar el siguiente comando para que nos haga una lista y ver si falta algo 
echo ">>> Compruebe si falta algo de lo que ha rellenado"
git config --global --list
#### En este caso sale lo siguiente:
# user.name=mi_nombre
# user.email=mi_email@gmail.com
# github.user=usuario
# core.autocrlf=true (o input)
# core.editor=vim (o nano, el que quieras)

# En caso de algún fallo puede usar, cambios manuales: 
# git config --global --edit

echo "FIN DE ESTA PARTE---------------------------------"

#### Consegir la SSH-key, IMPORTANTE!!!!! -> tiene que encontrarse en su usuario
# en home, vamos usa cd.
echo ">>> Ahora toca conseguir la SSH key"
# Genramos la SSH-key una vez hecho esto, pedirá que digamos yes, y nustra passphrse, o
# "contraseña" para ejecutar los comandos de git push y git pull además de otros. 
ssh-keygen -t rsa -b 4096 -C $correo
# Hacer entender al ordenador que queremos usar esta SSH-key
eval $(ssh-agent -s)
ssh-add ~/.ssh/id_rsa
# Le pedirá que entre la passphrase de nuevo
# Por último hay que copiar y pegarla en settings de GitHub -> SSH and GPG keys -> new SSH key
# Para ello puede visualizarla y copiarla con cat
echo "Esta es su SSH key, copie deste shh----email@email.com"
cat ~/.ssh/id_rsa.pub

