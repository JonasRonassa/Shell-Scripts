#! /usr/bin/env bash

# ------------------------------------------------------------------------------
# ./delete-files.sh
#
# Shell Scripting: Função para apagar todos os arquivos de mesma extensão, 
#                  de forma recursiva dentro de um diretório e das suas subpastas.
#
# Uso: delete-files.sh [caminho-para-o-diretório] [extensão]
#
# Ex.: ./delete-files.sh /home/user/musicas mp3
#
# Autor: Jonas Sousa
# Desde: Qui 17 Jun 2021 10:00:00 BRT 
# Versão: 1
# Licença: GPL
# ------------------------------------------------------------------------------

deleta_arquivos(){
    clear;
    caminho="$1";
    extensao=$(echo $2 | sed 's/^/*./');
    echo -e "Tem certeza que quer apagar todos os arquivos: '$2' em '$1' ? (y/n)";
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
            echo -e "\nA lista dos arquivos deletados se encontra no diretório:\n"$(pwd)"/arq-deletados.txt\n"
        else
            echo -e "Não foram encontrados arquivos com a extensão: $2."
        fi
    else
        echo -e "Operação finalizada."
    fi
}

deleta_arquivos $1 $2
