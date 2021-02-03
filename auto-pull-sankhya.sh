#!/bin/bash

updateRepositorio() {
    REPOSITORIO=$(find ~ -name sankhyaw | grep sankhyaw/sankhyaw)

    if [ -d "$REPOSITORIO" ]; then
        cd $REPOSITORIO
        cd ../
        git config credential.helper store
        git pull
    else
        echo "Repositório não encontrado!"
    fi
}

updateRepositorio

if [ $? -eq 0 ]; then
    echo -e "\nRepositório atualizado com sucesso!\n"
else
    echo -e "\nFalha ao tentar atualizar o repositório \n$REPOSITORIO\n"
fi
