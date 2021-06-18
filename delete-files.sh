#! /usr/bin/env bash

##################################
#   Script para apagar arquivos  #
#   de extenção definida.        #
##################################

# NOME: delete-files.sh
# SINOPSE: delete-files.sh <caminho-do-diretório> <extensão-dos-arquivos>

clear;
caminho="$1";
extensao=$(echo $2 | sed 's/^/*./');
echo -e "Tem certeza que quer apagar todos os: '$2' em --> '$1' ?(y/n)";
read opcao;
if [[ $opcao = 'y' ]];
then
    procurando_arq=$(find $1 -iname "$extensao")
    
    if [[ $procurando_arq != '' ]];
    then
        echo -e "$procurando_arq"| sed '/^$/d' >> arquivos    
        echo -e "\nApagando os arquivos com extensão $2.\n"
        while read arquivo;
        do
            rm -rv "$arquivo";
            echo "$arquivo" >> arq-deletados.txt
        done < arquivos
        rm arquivos;
        echo -e "\nScript finalizado."
        echo -e "\nUma lista dos arquivos deletados se encontram no diretório:\n"$(pwd)"/arq-deletados.txt\n"
    else
        echo -e "Não foram encontrados arquivos com a extensão: $2."
    fi
else
    echo -e "Operação finalizada."
fi


