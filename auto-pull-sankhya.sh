#!/bin/bash

updateRepositorio() {

    #REPOSITORIO=$(find ~ -name sankhyaw | grep sankhyaw/sankhyaw)
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

updateRepositorio

if [ $? -eq 0 ]; then
    echo -e "\nRepositório atualizado com sucesso!\n"
else
    echo -e "\nFalha ao tentar atualizar o repositório \n$REPOSITORIO\n"
fi
