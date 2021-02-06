#!/bin/bash
criarPastaLogs() {

    PASTA_LOGS=~/Logs

    if [ ! -d $PASTA_LOGS ]; then
        mkdir $PASTA_LOGS
    fi

}

criarPastaLogs

findRepositorio() {

    clear

    echo "---------------------------------"
    echo ""
    echo "PROCURANDO O REPOSITÓRIO SANKHYAW"
    echo ""
    echo "---------------------------------"

    REPOSITORIO=$(find / -path '*/sankhyaw/sankhya-js' | head -n 1)

}

findRepositorio 2>/dev/null

createBranch() {

    clear

    if [ -d "$REPOSITORIO" ]; then

        cd $REPOSITORIO
        cd ../

        echo "-----------------------------"
        echo ""
        echo "SANKHYA BRANCH - NOVA BRANCH"
        echo ""
        echo "-----------------------------"

        echo -e "\nNome da branch (numOS-versao): "
        read NOME_BRANCH
        echo -e "\nClonar da branch (versão): "
        read BRANCH_ORIGEM

        git checkout $BRANCH_ORIGEM
        git fetch
        git pull
        git checkout -b $NOME_BRANCH

    else

        echo "Repositório não encontrado!"
        return 1
    fi

}

createBranch 2>$PASTA_LOGS/log-sankhya-branch.log

if [ $? -eq 0 ]; then
    echo -e "\nBranch: $NOME_BRANCH\nCriada com sucesso!\n"
else
    echo -e "\nFalha ao tentar criar branch! Veja o log.\nRepositório:$NOME_BRANCH\n"
fi
