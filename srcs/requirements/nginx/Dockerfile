FROM debian:buster

#installing nginx
RUN apt update && apt install -y nginx

#passing the server configs to the container
COPY conf/nginx.conf /etc/nginx/sites-enabled/default

#we need Certificats for HTTPS (TLS), a custom Path can be set in the .env file
ARG CERTS
ADD $CERTS /certs/

#runs nginx, deamon off, so nginx runs in the foreground
#and the container doesnt exit instantly
CMD ["nginx", "-g", "daemon off;"]
