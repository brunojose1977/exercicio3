FROM ubuntu
RUN apt update -y
RUN apt-get update -y
RUN apt-get install -y tree
RUN apt-get install -y curl
RUN apt-get install -y nano
RUN apt-get install -y nginx
RUN apt install -y npm
#RUN tar czf sitehtml5.tar.gz ./sitehtml5/
COPY sitehtml5.tar.gz /usr/share/nginx/html 
RUN cd /usr/share/nginx/html
#RUN tar xzf sitehtml5.tar.gz .
#RUN rm sitehtml5.tar.gz .
#RUN npm i startbootstrap-one-page-wonder
#RUN npm run build 
#ENTRYPOINT service nginx start && npm run start && sleep 10d 
ENTRYPOINT sleep 10d