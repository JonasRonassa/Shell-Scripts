#! /usr/bin/env bash

# ------------------------------------------------------------------------------------
# ./delete-files.sh
#
# Shell Scripting: Função para apagar todos os arquivos com as extensões mkv, mp3,
#                  wma, avi, exe, msi, MOV, mov, mp4, wmv, psd, msu, mpg, tiff, MP4,
#                  wav, webm, cab, nrg, TIFF, ova de forma recursiva dentro de um 
#                  diretório e das suas subpastas.
#
# Uso: delete-files.sh [caminho-para-o-diretório]
#
# Ex.: ./delete-files.sh /home/user/musicas
#
# Autor: Jonas Sousa
# Desde: Qui 17 Jun 2021 10:00:00 BRT 
# Versão: 1.1
# Licença: GPL
# ------------------------------------------------------------------------------------

deleta_arquivos(){
    
    extensao=$(echo $2 | sed 's/^/*./');
    procurando_arq=$(find $1 -iname "$extensao")
    if [[ $procurando_arq != '' ]];
    then
        echo -e "$procurando_arq"| sed '/^$/d' >> arquivos    
        echo -e "### Apagando os arquivos com extensão $2. ###"
        while read arquivo;
        do
            rm -rv "$arquivo";
            echo "$arquivo" >> arq-deletados.txt
        done < arquivos
        rm arquivos;
    else
        echo -e "-> Não foram encontrados arquivos com a extensão: $2."
    fi
}

echo -e "Tem certeza que quer apagar todos esses arquivos? (y/n)";
read opcao;
if [[ $opcao = 'y' ]];
then
    echo -e "\nDeletando arquivos.\n"
    for formato in "mkv" "mp3" "wma" "avi" "exe" "msi" "MOV" "mov" "mp4" "wmv" "psd" "msu" "mpg" "tiff" "MP4" "wav" "webm" "cab" "nrg" "TIFF" "ova";
    do
        deleta_arquivos $1 $formato;
    done
    echo -e "\nScript finalizado."
    echo -e "\nA lista dos arquivos deletados se encontra no diretório:\n"$(pwd)"/arq-deletados.txt\n"
else
    echo -e "Operação finalizada."
fi
