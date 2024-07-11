#!/bin/bash

path_aplicacao_container=/usr/share/nginx/html
nome_arquivo_compactado=aplicacao.tar.gz
path_pasta_site_reactjs=/usr/share/nginx/html/site-reactjs

#TERCEIRO TESTE A SER FEITO

echo "Deploy da aplicação AllBooks na imagem que será usada no instanciamento do coiteiner Docker."
echo " "
echo "2 - Descompactando o projeto no container"
echo "----------------------------------------------------"
echo " "
echo " "
echo "O Tudo pronto, conforme previsto no Dockerfile o arquivo $nome_arquivo_compactado gerado na máquina host e copiado "
echo "para dentro do conteiner para a pasta web: $path_aplicacao_container."
echo "Então depois de descompactar serão realizados os comandos: npm install, build e run."
echo " "

#Rodando comandos a partir do WORKDIR definido no Dockerfile para onde esse script foi copiado no conteiner.
cp ./$nome_arquivo_compactado $path_aplicacao_container
cd $path_aplicacao_container
tar xzf $nome_arquivo_compactado .

#Iniciando os comandos de instalação, compilação. 
#OBS: A execução da aplicação (npm run start) será executado no ENTRYPOINT do Dockerfile
cd $path_pasta_site_reactjs
npm i startbootstrap-one-page-wonder
npm run build 

echo "Finalizada a instalação da aplicação React.js."
echo " "