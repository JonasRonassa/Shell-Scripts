#! /usr/bin/env bash

# ---------------------------------------------------------------------------------------
# ./dbth.sh (Delete bigger than hundred, Apague maiores que 100) 
#
# Shell Scripting:  Função para apagar todos os arquivos de tamanho maior que 100MB de 
#                   forma recursiva dentro de um diretório e das suas subpastas.
#
# Uso: dbth.sh [caminho-para-o-diretório]
#
# Ex.: ./dbth.sh /home/user/musicas
#
# Autor: Jonas Sousa
# Desde: Qui 24 Jun 2021 10:00:00 BRT 
# Versão: 1.0
# Licença: GPL
# ---------------------------------------------------------------------------------------


deleta_arquivos_por_tamanho(){
    diretorio=$1;
    tamanho=$2;
    temporaria=$(find $diretorio -size +"$tamanho"M);
    if [[ $temporaria != '' ]];
    then 
        echo -e "\nTem certeza que quer apagar todos esses arquivos? (y/n)";
        read opcao;
        if [[ $opcao = 'y' ]];
        then
            echo -e "$temporaria" | sed '/^$/d' >> arquivos
            echo -e "\n### Apagando todos os arquivos maiores que "$tamanho"MB. ###\n"
            while read arquivo;
            do
                rm -rv "$arquivo" 
                echo -e "$arquivo" >> arq-deletados.txt
            done < arquivos
            rm arquivos;
            echo -e "\nScript finalizado."
            echo -e "\nA lista dos arquivos deletados se encontra no diretório:\n"$(pwd)"/arq-deletados.txt\n"
        else
            echo -e "Operação finalizada."
        fi
    else
        echo -e "\n>>> Não existem arquivos com o tamanho maior que "$tamanho"MB. <<<\n"
    fi
    
}

deleta_arquivos_por_tamanho $1 100;