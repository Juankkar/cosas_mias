#!/usr/bin/env bash

## Escript para limpiar mis cuentas de GitHub. A veces
## los archivos .git, se vuelven muy pesados por algo 
## que no termino de entender, pero veo que con estos
## comandos puedo limpiar la información excesiva:

git for-each-ref --format='delete %(refname)' refs/original | git update-ref --stdin
git reflog expire --expire=now --all
git gc --prune=now
