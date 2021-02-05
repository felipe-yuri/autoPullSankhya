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

updateRepositorio() {

    clear

    if [ -d "$REPOSITORIO" ]; then
        cd $REPOSITORIO
        cd ../
        git config credential.helper store
        echo "------------------------------------------------"
        echo ""
        echo "ATUALIZANDO REPOSITÓRIO SANKHYAW (AUTO GIT-PULL)"
        echo ""
        echo "------------------------------------------------"

        #Método 1
        # remote=origin
        # for brname in $(git branch -r | grep $remote | grep -v master | grep -v HEAD | awk '{gsub(/^[^\/]+\//,"",$1); print $1}'); do git branch --track $brname $remote/$brname || true; done

        #Método 2
        # git branch -r | grep -v '\->' | while read remote; do git branch --track "${remote#origin/}" "$remote" || true; done
        # git fetch --all
        # git pull --all

        #Método 3 - Atualiza todas as branches existente
        # git branch -r | grep -v '\->' | while read remote; do
        #     git branch --track "${remote#origin/}" "$remote" || true
        #     NOME_BRANCH=$(echo $remote | awk -F/ '{ print $2}')
        #     git checkout $NOME_BRANCH
        #     # git fetch
        #     git pull
        # done

        #Método 4 - Atualiza somente as versões
        for versao in 'master' '4.7' '4.6' '4.5'; do
            git checkout $versao
            git fetch
            git pull
        done

        #Método 5 - Atualiza somente as 20 últimas branches commitadas
        # git for-each-ref --sort='-committerdate' --format='%(refname)%09%(committerdate)' refs/heads | sed -e 's-refs/heads/--'
        # git for-each-ref --sort='refname' --count=20 --format='%(refname)' 'refs/heads/**/4*[5-9]' | sed -e 's-refs/heads/--'
        # git fetch --all
        # git pull --all
        # git for-each-ref --sort='-committerdate' --format='%(refname)' refs/heads | sed -e 's-refs/heads/--' | head -n 20 '\->' | while read remote; do
        #     git branch --track "${remote#origin/}" "$remote" || true
        #     NOME_BRANCH=$(echo $remote | awk -F/ '{ print $2}')
        #     git checkout $NOME_BRANCH
        #     # git fetch
        #     git pull
        # done

    else
        echo "Repositório não encontrado!"
        return 1
    fi
}

updateRepositorio 2>$PASTA_LOGS/log-auto-pull-sankhya-update.log

if [ $? -eq 0 ]; then
    echo -e "\nRepositório: $REPOSITORIO\nAtualizado com sucesso!\n"
else
    echo -e "\nFalha ao tentar atualizar! Veja o log.\nRepositório:$REPOSITORIO\n"
fi
