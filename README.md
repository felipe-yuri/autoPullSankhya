# Auto Pull Sankhya

Shell script desenvolvido para realizar pull automático nos repositórios da Sankhya.

>Autor : Felipe Yuri Silva  - Email : felipys@gmail.com

>Autor : William de Oliveira Vitorazzi - Email :

## Tecnologias
- Shell Script (bash)

## Instalação
### Requisitos 
- Git bash ou PowerShell ou Terminal linux

#### 1. Clonar repositório utilizando o comando abaixo.

```bash
git clone https://github.com/felipys24/autoPullSankhya.git
```

## Rodar a aplicação
#### 1. Abrir a pasta do repositório *autoPullSankhya*.
#### 2. Abrir o git bash, powershell ou terminal linux.
#### 3. Executar o script *auto-pull-sankhya.sh* com o comando abaixo.
##### No gitbash ou terminal linux
```bash
bash auto-pull-sankhya.sh 
```
##### No powershell
```bash
.\auto-pull-sankhya.sh
```

## Erros e possíveis soluções
#### 1. Repositório não encontrado
##### Solução 1: Substituir a linha abaixo.
```bash
DE: REPOSITORIO=$(find / -path '*/sankhyaw/sankhya-js' | head -n 1)

PARA: REPOSITORIO=$("Caminho_do_repositorio_sankhyaw")
```
##### Solução 2: Trocar a / por . (ponto) e mover o script *auto-pull-sankhya.sh* para uma pasta anterior a pasta do repositório do sankhyaw. Desse modo, o script não interfere no repositório e será mais fácil encontrar a pasta do repositório de forma automática.
```bash
DE: REPOSITORIO=$(find / -path '*/sankhyaw/sankhya-js' | head -n 1)

PARA: REPOSITORIO=$(find . -path '*/sankhyaw/sankhya-js' | head -n 1)
```

## Agendar tarefa para executar o script diariamente

#### No linux
##### 1. Utilizar o *crontab*, que é o agendador de tarefas nativo do linux. E agendar uma tarefa como na linha mostrada na figura 1.
```bash
41 10   * * *   felipys bash ~/dev/Devops/autoPullSankhya/auto-pull-sankhya.sh

onde

MM HH   * * *   usuario bash caminho_do_script_auto_pull_sankhya

```
##### Figura 1
![Captura de Tela_select-area_20210203125659](https://user-images.githubusercontent.com/40077229/106773104-7baeba80-661f-11eb-9e61-e106b6b37f06.png)

##### 2. Apertar ctrl+x para fechar o crontab e salvar o arquivo. Pronto! Assim o script será executado diáriamente, todo dia no horário escolhido.

#### No windows
(em breve)