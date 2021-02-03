#!/bin/bash

updateRepositorio() {

    REPOSITORIO=$(find / -path '*/sankhyaw/sankhya-js' | head -n 1) 
    
    if [ -d "$REPOSITORIO" ]; then
        cd $REPOSITORIO
        cd ../
        git config credential.helper store
        git pull
    else
        echo "Repositório não encontrado!"
        return 1
    fi
}

updateRepositorio 2> log.txt

if [ $? -eq 0 ]; then
    echo -e "\nRepositório: $REPOSITORIO\nAtualizado com sucesso!\n"
else
    echo -e "\nFalha ao tentar atualizar!\nRepositório:$REPOSITORIO\n"
fi
