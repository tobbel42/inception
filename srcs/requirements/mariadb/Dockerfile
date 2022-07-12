FROM debian:buster

#install mariaDB
RUN apt update && apt install -y mariadb-server

#we need mariadb binded to 0.0.0.0 and listening on port 3306
COPY ./conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf

#expose opens up the port to the docker network
EXPOSE 3306

#we using build args to create the DB and to create our user
ARG DB_NAME
ARG DB_USER
ARG DB_HOST
ARG DB_USERPASS

#creating a user in the DB so the wordpress container can connect with it
RUN service mysql start &&\
	mysql -e "CREATE DATABASE $DB_NAME;" &&\
	mysql -e "CREATE USER '$DB_USER'@'$DB_HOST' IDENTIFIED BY '$DB_USERPASS';" &&\
	mysql -e "GRANT ALL PRIVILEGES ON $DB_NAME.* TO '$DB_USER'@'$DB_HOST';" && \
	mysql -e "FLUSH PRIVILEGES;"

#runs mariaDB service
CMD ["mysqld_safe"]
