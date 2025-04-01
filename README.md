# 🚀 Docker Learning Guide

Welcome to the **Docker Learning Guide**! This repository covers **theory + hands-on tasks** to help you master Docker from **zero to hero**. Perfect for GitHub & LinkedIn profile building! 😎

---

## 📌 Table of Contents

1. [Introduction to Docker](#introduction-to-docker)
2. [Containers vs Virtual Machines](#containers-vs-virtual-machines)
3. [Docker Architecture](#docker-architecture)
4. [Installing Docker](#installing-docker)
5. [Essential Docker Commands](#essential-docker-commands)
6. [Building and Running Docker Images](#building-and-running-docker-images)
7. [Docker Volumes & Networking](#docker-volumes--networking)
8. [Docker Compose & Multi-Container Apps](#docker-compose--multi-container-apps)
9. [Pushing Images to Docker Hub](#pushing-images-to-docker-hub)
10. [Advanced Topics (Multistage Builds, Trivy Scanning, etc.)](#advanced-topics)

---

## 1️⃣ Introduction to Docker

**Docker** is a **containerization** tool that helps you **package applications** along with their dependencies to run them anywhere.

✅ **Why use Docker?**
- Lightweight and fast
- Consistent environments across dev, testing, and production
- Simplifies deployment and scaling

### 🎯 **Task**
👉 Install Docker on your system (Windows/Linux/Mac) and verify using:
```sh
docker --version
```

---

## 2️⃣ Containers vs Virtual Machines

| Feature           | Containers | Virtual Machines |
|------------------|------------|-----------------|
| Startup Time     | Seconds     | Minutes        |
| Performance      | Lightweight | Heavy (Full OS) |
| Portability     | High        | Limited        |
| Isolation       | Process-level | Hardware-level |

### 🎯 **Task**
👉 Run your first container:
```sh
docker run hello-world
```

---

## 3️⃣ Docker Architecture

Docker follows a **client-server** model:
- **Docker Client:** CLI tool to interact with Docker Engine
- **Docker Engine:** Runs and manages containers
- **Docker Registry:** Stores Docker images (e.g., Docker Hub)

### 🎯 **Task**
👉 Check Docker architecture using:
```sh
docker info
```

---

## 4️⃣ Installing Docker

🔹 **For Linux:**
```sh
curl -fsSL https://get.docker.com | sh
sudo systemctl start docker
sudo systemctl enable docker
```

🔹 **For Windows & Mac:** [Download Docker Desktop](https://www.docker.com/products/docker-desktop/)

### 🎯 **Task**
👉 Run Docker and check the version:
```sh
docker --version
```

---

## 5️⃣ Essential Docker Commands

| Command                        | Description                        |
|--------------------------------|----------------------------------|
| `docker ps`                   | List running containers          |
| `docker images`               | List available images            |
| `docker run <image>`          | Run a container                  |
| `docker stop <container_id>`  | Stop a container                 |
| `docker rm <container_id>`    | Remove a container               |

### 🎯 **Task**
👉 Run an Ubuntu container and execute commands inside it:
```sh
docker run -it ubuntu bash
```

---

## 6️⃣ Building and Running Docker Images

A **Docker image** is a blueprint for containers. We use **Dockerfile** to create custom images.

🔹 **Example Dockerfile for Apache HTTP Server**
```dockerfile
FROM httpd:2.4
COPY ./public-html/ /usr/local/apache2/htdocs/
```

### 🎯 **Task**
👉 Build & run your first Docker image:
```sh
docker build -t my-apache .
docker run -d -p 8080:80 my-apache
```

---

## 7️⃣ Docker Volumes & Networking

✅ **Volumes** persist data across container restarts.
```sh
docker volume create my_volume
```

✅ **Networking** allows communication between containers.
```sh
docker network create my_network
```

### 🎯 **Task**
👉 Attach a volume and network to a container.

---

## 8️⃣ Docker Compose & Multi-Container Apps

✅ **Docker Compose** manages multi-container applications using `docker-compose.yml`.

🔹 **Example `docker-compose.yml` for WordPress**
```yaml
version: '3'
services:
  db:
    image: mysql:5.7
    environment:
      MYSQL_ROOT_PASSWORD: example
  wordpress:
    image: wordpress:latest
    ports:
      - "8080:80"
```

### 🎯 **Task**
👉 Deploy WordPress using Docker Compose.
```sh
docker-compose up -d
```

---

## 9️⃣ Pushing Images to Docker Hub

✅ Steps to **push** an image to Docker Hub:
```sh
docker login
```
```sh
docker tag my-apache my-dockerhub-username/my-apache
```
```sh
docker push my-dockerhub-username/my-apache
```

### 🎯 **Task**
👉 Push your custom Docker image to **Docker Hub**.

---

## 🔟 Advanced Topics

### ✅ **Multistage Dockerfile** (For smaller images)
```dockerfile
FROM golang:alpine AS builder
WORKDIR /app
COPY . .
RUN go build -o main .

FROM alpine
COPY --from=builder /app/main /
CMD ["/main"]
```

### ✅ **Trivy for Security Scanning**
```sh
trivy image my-dockerhub-username/my-apache
```

### 🎯 **Task**
👉 Implement multistage builds & security scans.

---

## 🎯 Next Steps

✅ Complete the hands-on tasks.  
✅ Post your progress on **GitHub & LinkedIn**.  
✅ Keep exploring **real-world Docker use cases**! 🚀🔥

---

## 📢 Need Help?
💬 Feel free to reach out or raise an issue in this repository!

---

🔥 **Follow for More DevOps Content!** 🔥

