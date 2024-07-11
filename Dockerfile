FROM ubuntu
WORKDIR /app

RUN apt update -y
RUN apt-get update -y
RUN apt-get update --fix-missing
RUN apt-get install -y tree
RUN apt-get install -y curl
RUN apt-get install -y nano
RUN apt-get install -y nginx
RUN apt install -y npm

# Pré-requsito para a execução da imagem:
# Antes da execução do comando "docker build" que vai executar o Dockerfile, vc precisa rodar o script de compactação "compactar-app-host.sh".
# Esse script vai gerar o arquivo: aplicacao.tar.gz 

# Agora vou copiar o arquivo compactado do site React.js e o script shell de descompactação e instalação da aplicação
COPY aplicacao.tar.gz .
COPY descompactar-app-conteiner.sh .

# Agora rodar o o script de descompactação
RUN ./descompactar-app-conteiner.sh

ENTRYPOINT service nginx start && cd /usr/share/nginx/html/site-reactjs/ && npm run start && sleep 10d 
#ENTRYPOINT sleep 10d