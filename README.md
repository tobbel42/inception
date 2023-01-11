# Inception

## Description
<br>
The task of the Project was to set up a LEMP-stack
using Docker and Docker compose.<br>
A LEMP-stack consists of a NGINX(E)-Server, a MySQL(M)-Database and a PHP service(P), all run on a Linux.<br>
<br>
For this project I had to run each service (NGINX, Wordpress and MariaDB in this case) in its own container. The containers are connected via a docker-network and the NGINX server serves as the only entry point from outside. To make the data persist, the containers have different docker volumes mounted.<br>
<br>
Credentials are supplied using the .env file, which was required to be in the git repository for this project<br>
Note: this is a **HUGE SECURITY LEAK** in any real-live-application

![project_sketch](/images/project_sketch.png)
