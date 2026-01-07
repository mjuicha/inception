# USER DOCUMENTATION

## Services Provided

The project deploys a web infrastructure using Docker, composed of the following services:

- **Nginx:** Handles all coming requests and redirects them to the wordpress service if secure.
- **Wordpress**: Service that manages website.
- **MariaDB**: Database that stores all site data.

---

## Managing Services 
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
## Accessing Services

**Website:** https://mjuicha.42.fr

**Wordpress Dashboard:** https://mjuicha.42.fr/wp-admin

## Managing Credentials

### Where Credentials Are Stored

All credentials used by the project are stored in the environment file:
This file contains:
- MariaDB root password
- WordPress database user and password
- WordPress administrator credentials
- Domain name
  
The file is loaded by Docker Compose at runtime and shared securely between containers through environment variables.

## Checking Service Health

### View All Services Status

```bash
make status
```

Expected output:
```
NAME         IMAGE                 STATUS          PORTS
mariadb      mariadb:inception     Up 2 minutes    3306/tcp
wordpress    wordpress:inception   Up 2 minutes    9000/tcp
nginx        nginx:inception       Up 2 minutes    0.0.0.0:443->443/tcp
```

### View Service Logs

**All services:**
```bash
make logs
```

**Specific service:**
```bash
docker-compose -f srcs/docker-compose.yml logs wordpress
```

**Follow logs in real-time:**
```bash
docker-compose -f srcs/docker-compose.yml logs -f nginx
```
