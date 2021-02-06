# Auto Pull Sankhya

## 🚀 Começando

**Problema**: Em virtude da grande quantidade de código sobrescrito (perdido) após a clonagem de branches sem realizar um pull previamente, surgiu a necessidade da solução abaixo.

**Solução**: Foi desenvolvido um script para realizar pull automático diariamente nas versões (branches), um outro script que auxilia e garante a correta criação de branches dos repositórios da Sankhya.

## ✒️ Autores
> **Felipe Yuri Silva Bonfillioli**  - [Github](https://github.com/felipys24) - [Email](felipys@gmail.com)

> **William de Oliveira Vitorazzi** - [Github](https://github.com/Vittorazzi) - [Email](wvittorazzi@gmail.com)

## 📌 Linguagem
- Shell Script (bash)

## 📋 Requisitos 
- Git bash ou PowerShell ou Terminal linux
- Crontab ou Agendador de Tarefas qualquer
## 🔧 Instalação

1. Clonar repositório utilizando o comando abaixo.

```bash
git clone https://github.com/felipys24/autoPullSankhya.git
```

## ⚙️ Rodar a aplicação
1. Abrir a pasta do repositório *autoPullSankhya*.
2. Abrir o git bash, powershell ou terminal linux.
3. Executar o script *auto-pull-sankhya.sh* com o comando abaixo. E digitar login e senha somente essa primeira vez.

##### No gitbash ou terminal linux
```bash
bash auto-pull-sankhya.sh 
```
##### No powershell
```bash
.\auto-pull-sankhya.sh
```
4. Para criar branches com o *sankhya-branch*, deve-se executar o comando abaixo e seguir os próximos passos

##### No gitbash ou terminal linux
```bash
bash sankhya-branch.sh 
```
##### No powershell
```bash
.\sankhya-branch.sh
```
5. Após executar o script acima, inserir o nome da branch que deseja criar. Segue um exemplo.

```text
Nome da branch (numOS-versao): 1580508-4.5 
```
6. Em seguida, inserir o nome da branch que vai ser clonada, ou seja, a branch vai ser criada a partir dessa.

```text
Clonar da branch (versao): 4.5 
```
Figura 1
![Captura de Tela_deepin-terminal_20210205232112](https://user-images.githubusercontent.com/40077229/107108473-e83fda00-6816-11eb-9aae-c6270e97ca97.png)

## 🛠️ Erros e possíveis soluções
1. Repositório não encontrado

**Solução 1**: Substituir a linha abaixo.
```bash
DE: REPOSITORIO=$(find / -path '*/sankhyaw/sankhya-js' | head -n 1)

PARA: REPOSITORIO=$("Caminho_do_repositorio_sankhyaw")

OU

PARA: REPOSITORIO="C:/Caminho_do_repositorio_sankhyaw"
```
**Solução 2**: Trocar a / por . (ponto) e mover o script *auto-pull-sankhya.sh* para uma pasta anterior a pasta do repositório do sankhyaw. Desse modo, o script não interfere no repositório e será mais fácil encontrar a pasta do repositório de forma automática.
```bash
DE: REPOSITORIO=$(find / -path '*/sankhyaw/sankhya-js' | head -n 1)

PARA: REPOSITORIO=$(find . -path '*/sankhyaw/sankhya-js' | head -n 1)
```

## 📄 Agendar tarefa

### No linux
1. Utilizar o *crontab*, que é o agendador de tarefas nativo do linux. E agendar uma tarefa como na linha mostrada na figura 2.
```bash
41 10   * * *   felipys bash ~/dev/Devops/autoPullSankhya/auto-pull-sankhya.sh

onde

MM HH   * * *   usuario bash caminho_do_script_auto_pull_sankhya

```
Figura 2
![Captura de Tela_select-area_20210203125659](https://user-images.githubusercontent.com/40077229/106773104-7baeba80-661f-11eb-9e61-e106b6b37f06.png)

2. Apertar ctrl+x para fechar o crontab e salvar o arquivo. Pronto! Assim o script será executado diáriamente no horário escolhido.

3. Será necessário dar permissão de execução ao script, através do comando abaixo, para que o crontab consiga executa-lo.
```bash
chmod +x auto-pull-sankhya.sh
```

### No windows

##### No Windows o procedimento é feito através do agendamento de Tarefas:

![Imgur](https://i.imgur.com/UQh2JH2.png)

##### 1. Após entrar no agendador de Tarefas, clique em "Criar Tarefa Básica":

![Imgur](https://i.imgur.com/nHK2F6T.png)

##### 2. Nos passos a seguir, a maioria das preferências são customizáveis. Os prints a seguir demonstram o padrão que julgamos mais adequado:

![Imgur](https://i.imgur.com/7loIER4.png)

![Imgur](https://i.imgur.com/GK9tSBb.png)

##### 3. Selecione "Executar um programa", uma nova janela irá se abrir. Nesta janela, informe o caminho do script baixado (os outros campos não são necessários). 

![Imgur](https://i.imgur.com/yQwpKsr.png)

![Imgur](https://i.imgur.com/DLzWAlF.png)

##### 4. Por fim, verifique se está tudo de acordo com suas preferências e clique em Concluir.

![Imgur](https://i.imgur.com/tfa5nbu.png)

## ⌨️ Registros (logs)
Os registros desses scripts podem ser encontrados nos caminhos abaixo:

**No linux**
```bash
~/Logs/
```

**No windows**
```bash
Sua_Unidade:\Users\Seu_Usuario\Logs\
```
