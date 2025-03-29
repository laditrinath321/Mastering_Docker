# Docker Learning - Practical Implementation

## Topics Covered
1. Docker Volumes
2. Bind Mounts
3. Creating a Dockerfile for `httpd` using `amazonlinux` as the base image
4. Building a Docker Image
5. Running an Application (`index.html` page) inside a Container

---

## 1. Docker Volumes
### Commands Used:
```sh
cd /var/lib/docker/volumes/
ll
cd vol1
ls
cd _data/
ls
ll
docker volume ls
docker volume inspect vol1
docker volume rm vol1
```
### Explanation:
- Checked available Docker volumes
- Navigated inside the volume directory
- Inspected volume details
- Removed unused volumes

---

## 2. Bind Mounts
### Commands Used:
```sh
docker run -it --name cont3 -v /opt:/app/logs amazonlinux
```
### Explanation:
- Used a bind mount to mount `/opt` from the host to `/app/logs` in the container
- Allowed persistent storage between host and container

---

## 3. Creating a Dockerfile for `httpd` using `amazonlinux`
### Commands Used:
```sh
vim Dockerfile
cat Dockerfile
```
### Example Dockerfile:
```Dockerfile
FROM amazonlinux
RUN yum install -y httpd
COPY index.html /var/www/html/
CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]
EXPOSE 80
```
### Explanation:
- Used Amazon Linux as the base image
- Installed Apache (`httpd`)
- Copied an `index.html` file
- Set Apache as the default running process
- Exposed port 80

---

## 4. Building the Docker Image
### Commands Used:
```sh
docker build -t testimg:v1 -f Dockerfile .
docker build -t devopshubg333/batch15d:httpd -f Dockerfile .
docker build -t devopshubg333/batch15d:httpd_amazonlinx -f Dockerfile .
```
### Explanation:
- Built Docker images from the `Dockerfile`
- Tagged the images appropriately

---

## 5. Running an Application (`index.html` page) inside a Container
### Commands Used:
```sh
docker run -it --name ct1 -p 8082:80 testimg:v1
docker run -it --name ct5 -p 8085:80 devopshubg333/batch15d:httpd_amazonlinx
```
### Explanation:
- Ran the container exposing Apache on different ports
- Hosted `index.html` inside the container

---

## 6. Pushing Image to Docker Hub
### Commands Used:
```sh
docker push devopshubg333/batch15d:httpd_amazonlinx
```
### Explanation:
- Pushed the custom-built image to Docker Hub for future use

---

## Clean-up Commands Used:
```sh
docker volume prune
docker system prune
docker container prune
docker images prune
```
### Explanation:
- Removed unused volumes, images, and containers to free up space

