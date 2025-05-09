# Instrucciones para construir y ejecutar imagen Docker con PostgreSQL

## 1. Construcción de la imagen
Donde se encuentra el Dockerfile ejecutar:
```bash
$ docker build -t nombre-de-imagen .
```


## 2. Ejecución del contenedor
Para ejecutar un contenedor:
```bash
$ docker run --name nombre-del-contenedor -p 5433:5432 -e POSTGRES_PASSWORD=123 -d nombre-de-imagen
```


## 3. Ingresar al contenedor
Para acceder al contenedor en ejecución:
```bash
$ docker exec -it nombre-del-contenedor bash
```

Una vez dentro:
```bash
$ psql -U myuser -d mydb
```


## 4. Subir imagen a Docker Hub
a. Iniciar sesión en Docker Hub:
```bash
$ docker login
```


b. Etiquetar la imagen:
```bash
$ docker tag nombre-de-imagen tu-usuario-dockerhub/nombre-de-imagen
```


c. Subir la imagen:
```bash
$ docker push tu-usuario-dockerhub/nombre-de-imagen
```