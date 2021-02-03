#!/bin/bash

updateRepositorio() {
    
    clear

    REPOSITORIO=$(find / -path '*/sankhyaw/sankhya-js' | head -n 1) 
    
    if [ -d "$REPOSITORIO" ]; then
        cd $REPOSITORIO
        cd ../
        git config credential.helper store
        echo "------------------------------------------------"
        echo ""
        echo "ATUALIZANDO REPOSITÓRIO SANKHYAW (AUTO GIT-PULL)"
        echo ""
        echo "------------------------------------------------"
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
    echo -e "\nFalha ao tentar atualizar! Veja o log.\nRepositório:$REPOSITORIO\n"
fi
