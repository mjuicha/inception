*This project has been created as part of the 42 curriculum by mjuicha.*

# Inception

## Description

**Inception** is a system administration and DevOps project that introduces containerization using **Docker**.  
The goal is to build a small infrastructure composed of multiple services running in **isolated Docker containers**, orchestrated with **Docker Compose**.

This project focuses on:
- Understanding how Docker works internally
- Building custom Docker images
- Managing networks, volumes, and environment variables
- Deploying a complete web stack without using pre-built images

The infrastructure includes:
- **Nginx** (web server with SSL)
- **WordPress** (PHP application)
- **MariaDB** (database)
- Docker volumes for persistent data
- A dedicated Docker network

---

## Instructions

### Before running the project

Before running the project, you must configure the required environment files.

1. Copy the environment file into the `srcs/` directory:
```bash
cp .env.example srcs/.env
```

To build and start the project, run the following command in the root directory:

```
make up
```

To stop the running containers:

```
make stop
```

To start the containers if they are already built:

```
make start
```

To remove all containers and networks:

```
make clean
```

To remove everything, including volumes:

```
make fclean
```
To restart the project again using the Makefile, run:

```
make re
```
## Resources

### Documentation & References

- Docker Ressources
  https://www.scaler.com/topics/docker/what-is-docker/
  https://docs.docker.com/

- Nginx & MariaDB Ressources
  https://medium.com/@afatir.ahmedfatir/unveiling-42-the-network-inception-a-dive-into-docker-and-docker-compose-cfda98d9f4ac

- PHP-FPM
  https://www.freecodecamp.org/news/the-nginx-handbook/


AI tools were used as **learning and assistance resources** during this project.

They were used for:
- Understanding Docker concepts (images, containers, networks, volumes)
- Clarifying configuration files (Dockerfiles, `docker-compose.yml`, Nginx, PHP-FPM, MariaDB)
- Explaining errors and debugging build/runtime issues
- Improving documentation structure and readability


## Project description

So in this project I created one Dockerfile for each service. Of course this wasn't my choice every service were different from each other so in order to create different docker images for them i needed to have different dockerfiles. 

Also there is one config file for each one of them too. Every single service has their configuration file needed. I could use commands like echo to write them inside Dockerfile but copying from host machine is best practice for later. Like it makes it easier to modify.

And as you see there is a entrypoint script file inside every single service too. I needed to run some commands that requires environment variables which are not reachable inside Dockerfiles. And even it did it shouldn't be making sense because once an image gets compiled even after changing variable it wouldnt be effected.

And I think I should have an explanation for nginx script too. I ran creating certificate command on script because a private thats inside the image which is reachable is reachable from others too. So we are just keeping inside a script that get runs from container to keep it safe. 

#### VIRTUAL MACHINES VS DOCKER 
So this is an easy one. Virtual machines are cool to seperate project from host and probably the best one out there but they cost more than docker container. 
If you setup an virtual machine it should have its own kernel module running which costs space and ofcourse cpu and ram power. In the other hand dockers servers runtime environment to run containers of its own for different platforms that uses same kernel as operating system. This is more efficient rather than virtual machines. And for this reason even virtual machines are better in containerization docker wins.

#### Secrets vs Environment Variables
So in every project there are variables like passwords, usernames, domains etc. And they should be configurable so we use tools to have them as environment variables. But is it completely safe? No. 

If someone reaches out the running process they are able to access env variables. And think that someone does it and accesses your admin password or worse database password. Yes its over. 

So we have secrets! Every configuration option that will lead it to going over is a secret. Your db password your root user username everything! Docker servers these secrets files to the containers and handleing them is up to you ofcourse. 

#### Docker Network vs Host Network

So docker servers an internal network service. Services can communicate with each other with service names if they are connected to the same network. These services can't communicate with outside world if there are no ports opened to it.

On the other hand host network is not private its accessible from host just like any other service running inside it.

#### Docker Volumes vs Bind Mounts

So docker volumes are handled by docker in somewhere inside host filesystem. When a container starts docker just giving it some space and make file operations inside it. Everything is selfworking and shouldn't be modified manually.

In the other hand there is bind mounts. They are like symlinks to our host machine. Linked paths between our computer and docker container. If you setup a bind mount you can easily track, modify the files inside container.
